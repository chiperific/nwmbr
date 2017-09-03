class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :user_tracks, :users, column: :approved_by
    add_foreign_key :links, :users, column: :approved_by
    add_foreign_key :link_flags, :users, column: :resolved_by
    add_foreign_key :user_flags, :users, column: :flagged_by
    add_foreign_key :user_flags, :users, column: :resolved_by
  end
end
