class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :owner
      t.integer :album_id

      t.timestamps
    end
  end
end
