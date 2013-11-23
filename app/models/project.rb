class Project < ActiveRecord::Base
  attr_accessible :deploy_public_key, :github_repo, :user_id
end
