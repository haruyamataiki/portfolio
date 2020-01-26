class Team < ApplicationRecord
	attachment :team_image
	belongs_to :customer
    has_many :team_relationships,foreign_key: "followed_id"
    has_many :follower_customers, through: :team_relationships, source: :follower
    has_one :room

  def follow(team)
    follower.create(followed_id: team.id)
  end
  # ユーザーのフォローを外す
  def unfollow(team)
    follower.find_by(followed_id: team.id).destroy
  end
  # フォローしていればtrueを返す
  def following?(team)
    follower.exists?(followed_id: team.id)
  end

   # 検索バー
  def self.search(search)
    if search
       Team.where(['name LIKE ?', "%#{search}%"])
    else
       Team.all
    end
  end

end
