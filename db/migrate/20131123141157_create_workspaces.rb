class CreateWorkspaces < ActiveRecord::Migration
  def change
    create_table :workspaces do |t|
      t.text :path
      t.string :status
      t.integer :build_id

      t.timestamps
    end
  end
end
