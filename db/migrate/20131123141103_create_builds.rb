class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.integer :project_id
      t.boolean :deployed
      t.string :branch_name

      t.timestamps
    end
  end
end
