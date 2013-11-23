class Project < ActiveRecord::Base
  attr_accessible :deploy_public_key, :github_repo, :deploy_repo, :user_id, :travis_token, :github_token, :heroku_token
  validates_uniqueness_of :github_repo

  has_many :builds, dependent: :destroy

  after_create :add_key_to_github!
  after_create :add_key_to_heroku!
  after_create :fetch_builds!

  def fetch_builds!
    missing_builds.each do |build|
      Build.create!({
        travis_id: build.number.to_i,
        project_id: self.id,
        deployed: false,
        branch_name: build.try(:commit).try(:branch)
      })
    end
  end

  def travis_project
    Travis.access_token = self.travis_token
    Travis::Repository.find(github_repo.gsub('git@github.com:', ''))
  end

  def add_key_to_github!
    begin
      github = Github.new(oauth_token: github_token)
      user, repo = github_repo.split("/")
      github.repos.keys.create(user, repo, title: "deployr", key: deploy_public_key)
    rescue ; end
  end

  def add_key_to_heroku!
    heroku = Heroku::API.new(api_key: heroku_token)
    heroku.post_key(self.deploy_public_key)
  end

  private

  def missing_builds
    travis_project.builds.select { |b| b.number.to_i > (builds.try(:last).try(:travis_id) || -1) }
  end
end
