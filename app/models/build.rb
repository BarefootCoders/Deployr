class Build < ActiveRecord::Base
  attr_accessible :branch_name, :deployed, :project_id, :travis_id
  belongs_to :project
  has_many :workspaces, dependent: :destroy

  default_scope { order("travis_id ASC") }

  def attempt_deploy
    return false unless deployable_build?
    Workspace.create!({
      build_id: self.id
    })
  end

  def deployable_build?
    travis_build.green?
  end

  def travis_build
    travis_project.build(self.travis_id)
  end

  private

  def travis_project
    self.project.send(:travis_project)
  end
end
