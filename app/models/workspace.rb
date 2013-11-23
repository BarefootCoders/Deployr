class Workspace < ActiveRecord::Base
  attr_accessible :build_id, :path, :status
end
