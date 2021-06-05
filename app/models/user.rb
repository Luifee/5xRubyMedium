class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {
    user: 0,
    vip_user: 1,
    platinum_user: 2,
    admin: 3
  }
  # relationships
  has_many :memos
  has_many :follows
  has_many :comments
  has_many :clips
  has_one_attached :avatar
  # validations
  validates :username, presence: true, uniqueness: true

  # instance method
  def paid_user?
    vip_user? or platinum_user?
  end

  def follow?(user)
    follows.exists?(following: user)
  end

  def follow!(user)
    if follow?(user)
      follows.find_by(following: user).destroy
      return 'Follow'
    else
      follows.create(following: user)
      return 'Followed'
    end
  end

  def clip?(memo)
    clips.exists?(memo: memo)
  end

  def clip!(memo)
    if clip?(memo)
      clips.find_by(memo: memo).destroy
      return 'Clip'
    else
      clips.create(memo: memo)
      return 'Clipped'
    end
  end

end
