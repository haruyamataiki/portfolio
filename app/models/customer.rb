class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :recruitments, dependent: :destroy
  has_many :teams
  attachment :profile_image

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  def follow(customer)
    follower.create(followed_id: customer.id)
  end
  
  # ユーザーのフォローを外す
  def unfollow(customer)
    follower.find_by(followed_id: customer.id).destroy
  end
  
  # フォローしていればtrueを返す
  def following?(customer)
    follower.exists?(followed_id: customer.id)
   
  end

  # 50m走のスコアを点数に変換
    def convert_running
  	case running_score
  	  when 0..6.6
  	  	100
  	  when 6.7..6.8
  	  	90
  	  when 6.9..7.0
  	  	80
  	  when 7.1..7.2
  	  	70
  	  when 7.3..7.5
  	  	60
  	  when 7.6..7.9
  	  	50
  	  when 8.0..8.4
  	  	40
  	  when 8.5..9.0
  	  	30
  	  when 9.1..9.7
  	  	20
  	  else
  	  	10
  	 end
   end

  # 立ち幅跳びのスコアを点数に変換
  def convert_jumping
	case jumping_score
	  when 0..149
	   	10
	  when 150..169
	    20
	  when 170..187
	    30
	  when 188..202
	  	40
	  when 203..217
	  	50
	  when 218..229
	  	60
	  when 230..241
	  	70
	  when 242..253
	  	80
	  when 254..264
	  	90
	  else
	    100
	end
   end

  # 反復横跳びのスコアを点数に変換
  def convert_agility
	case agility_score
	  when 0..29
	   	10
	  when 30..36
	    20
	  when 37..40
	    30
	  when 41..44
	  	40
	  when 45..48
	  	50
	  when 49..52
	  	60
	  when 53..55
	  	70
	  when 56..59
	  	80
	  when 60..62
	  	90
	  else
	    100
	end
   end

  # 上体起こしのスコアを点数に変換
  def convert_sit_ups
	case sit_ups_score
	  when 0..12
	   	10
	  when 13..15
	    20
	  when 16..18
	    30
	  when 19..21
	  	40
	  when 22..24
	  	50
	  when 25..26
	  	60
	  when 27..29
	  	70
	  when 30..32
	  	80
	  when 33..34
	  	90
	  else
	    100
	end
   end

     # 握力のスコアを点数に変換
  def convert_grip_strength
	case grip_strength_score
	  when 0..17
	   	10
	  when 18..22
	    20
	  when 23..27
	    30
	  when 28..32
	  	40
	  when 33..37
	  	50
	  when 38..42
	  	60
	  when 43..46
	  	70
	  when 47..50
	  	80
	  when 51..55
	  	90
	  else
	    100
	end
   end

   def set_total
   	total_score = convert_jumping + convert_running + convert_agility + convert_sit_ups + convert_grip_strength
   end
end
