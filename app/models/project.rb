class Project < ActiveRecord::Base
  attr_accessible :deploy_public_key, :github_repo, :deploy_repo, :user_id

  has_many :builds, dependent: :destroy
end
