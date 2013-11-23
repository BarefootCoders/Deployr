class Build < ActiveRecord::Base
  attr_accessible :branch_name, :deployed, :project_id
end
