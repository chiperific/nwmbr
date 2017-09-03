class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  has_many :user_tracks
  has_many :links
  validates_inclusion_of :role, in: %w( Guest Contributor Moderator Admin )

  ROLES = %i[guest contributor moderator admin]
  # for view forms <%= f.collection_select(:role, User::ROLES, :to_s, lambda{|i| i.to_s.humanize}) %>
  # https://github.com/CanCanCommunity/cancancan/wiki/Role-Based-Authorization#one-role-per-user


  def ability
    @ability ||= Ability.new(self)
  end

  delegate :can?, :cannot?, to: :ability

  def self.has_authority_over(user)
    @authority_hsh = { "Guest" => 0, "Contributor" => 1, "Moderator" => 2, "Admin" => 3 }

    @your_auth = @authority_hsh[current_user.role]
    @their_auth = @authority_hsh[user.role]

    if @your_auth > @their_auth
      true
    else
      false
    end
  end
end
