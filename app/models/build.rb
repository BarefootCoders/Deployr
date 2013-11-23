class Build < ActiveRecord::Base
  attr_accessible :branch_name, :deployed, :project_id
  belongs_to :project
  has_many :workspaces, dependent: :destroy

  def attempt_deploy
    return unless deployable_build?
    Workspace.create!(project, branch_name)
  end

  def deployable_build?
    raise NotImplementedError
  end
end
