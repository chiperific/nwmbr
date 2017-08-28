class CreateUserTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tracks do |t|
      t.references :user, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
