class CreateUserFlags < ActiveRecord::Migration[5.1]
  def change
    create_table :user_flags do |t|
      t.references :user, foreign_key: true
      t.string :comment
      t.integer :flagged_by #has foreign key
      t.datetime :flagged_at
      t.integer :resolved_by #has foreign key
      t.datetime :resolved_at
      t.boolean :resolved_status

      t.timestamps
    end
  end
end
