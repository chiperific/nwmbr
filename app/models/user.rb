class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  has_many :user_tracks
  validates_inclusion_of :role, in: %w( Guest Contributor Moderator Admin )

  ROLES = %i[guest contributor moderator admin]
  # for view forms <%= f.collection_select(:role, User::ROLES, :to_s, lambda{|i| i.to_s.humanize}) %>
  # https://github.com/CanCanCommunity/cancancan/wiki/Role-Based-Authorization#one-role-per-user

  def ability
    @ability ||= Ability.new(self)
  end

  delegate :can?, :cannot?, to: :ability
end
