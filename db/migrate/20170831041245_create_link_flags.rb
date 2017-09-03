class CreateLinkFlags < ActiveRecord::Migration[5.1]
  def change
    create_table :link_flags do |t|
      t.references :user, foreign_key: true
      t.references :link, foreign_key: true
      t.string :comment, null: false
      t.integer :flagged_by, null: false
      t.datetime :flagged_at, null: false
      t.integer :resolved_by #has foreign key
      t.datetime :resolved_at
      t.boolean :resolved_status

      t.timestamps
    end
  end
end
