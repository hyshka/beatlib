class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :music_styles, :string
    add_column :users, :music_do, :string
    add_column :users, :website, :string
    add_column :users, :avatar_file_name, :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size, :string
    add_column :users, :avatar_updated_at, :datetime
  end
end
