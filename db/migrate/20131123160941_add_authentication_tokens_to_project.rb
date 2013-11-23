class AddAuthenticationTokensToProject < ActiveRecord::Migration
  def change
    add_column :projects, :travis_token, :string
    add_column :projects, :github_token, :string
  end
end
