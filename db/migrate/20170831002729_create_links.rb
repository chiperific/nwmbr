class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.references :user, foreign_key: true, dependent: :delete, null: false
      t.string :url, null: false
      t.string :comment
      t.string :location, null: false
      t.string :author_name, null: false
      t.string :author_url
      t.boolean :approved
      t.datetime :approved_at #has foreign key
      t.integer :approved_by
      t.boolean :archived, null: false, default: false

      t.timestamps
    end
  end
end
