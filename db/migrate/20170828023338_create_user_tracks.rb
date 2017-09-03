class CreateUserTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tracks do |t|
      t.references :user, foreign_key: true, dependent: :delete
      t.string :role_assigned
      t.string :role_requested, null: false, default: "Guest"
      t.integer :approved_by # has foreign key
      t.datetime :approved_at

      t.timestamps
    end
  end
end
