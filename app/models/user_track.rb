class UserTrack < ApplicationRecord
  belongs_to :user

  validates_inclusion_of :role, in: %w( Guest Contributor Moderator Admin )

  ROLES = %i[guest contributor moderator admin]
  # for view forms <%= f.collection_select(:role, UserTrack::ROLES, :to_s, lambda{|i| i.to_s.humanize}) %>
end
