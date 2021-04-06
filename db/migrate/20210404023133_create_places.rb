class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.integer :region_id
      t.string :name
      t.string :image_id
      t.text :explanation
      t.string :ground

      t.timestamps
    end
  end
end
