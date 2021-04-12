class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :ground
      t.text :comment
      t.text :explanation

      t.timestamps
    end
  end
end
