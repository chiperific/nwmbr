class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true, dependent: :destroy, null: false
      t.string :location
      t.string :comment
      t.boolean :archived, null: false, default: false

      t.timestamps
    end
  end
end
