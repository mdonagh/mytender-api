class DenormalizePhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :banner_url, :string
    add_column :users, :headshot_url, :string
  end
end
