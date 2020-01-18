class Team < ApplicationRecord
	attachment :team_image
	belongs_to :customer
    has_many :team_relationships,foreign_key: "followed_id"
    has_many :follower_customers, through: :team_relationships, source: :follower
    has_one :room
end
