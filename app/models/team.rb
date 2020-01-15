class Team < ApplicationRecord
	attachment :team_image
	belongs_to :customer
end
