class ChangeCommentsToPlaceComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :comments, :place_comments
  end
end
