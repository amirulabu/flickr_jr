class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
