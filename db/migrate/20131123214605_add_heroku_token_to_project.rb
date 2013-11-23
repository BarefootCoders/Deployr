class AddHerokuTokenToProject < ActiveRecord::Migration
  def change
    add_column :projects, :heroku_token, :string
  end
end
