class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :github_repo
      t.text :deploy_public_key

      t.timestamps
    end
  end
end
