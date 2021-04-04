class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :image
      t.text :explanation
      t.string :ground

      t.timestamps
    end
  end
end
