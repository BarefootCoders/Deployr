class AddTravisIdToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :travis_id, :integer
  end
end
