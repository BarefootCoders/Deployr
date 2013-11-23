class Project < ActiveRecord::Base
  attr_accessible :deploy_public_key, :github_repo, :deploy_repo, :user_id, :travis_token, :github_token

  has_many :builds, dependent: :destroy

  after_create :fetch_builds!

  def fetch_builds!
    missing_builds.each do |build|
      Build.create!({
        travis_id: build.number,
        project_id: self.id,
        deployed: false,
        branch_name: build.try(:commit).try(:branch)
      })
    end
  end

  private
  
  def travis_project
    Travis::Pro.access_token = self.travis_token
    Travis::Pro::Repository.find(github_repo.gsub('git@github.com:', ''))
  end

  def missing_builds
    travis_project.builds(after_number: (builds.last.try(:travis_id) || 0))
  end
end
