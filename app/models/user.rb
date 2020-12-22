class User < ApplicationRecord

  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  #アソシエーション(1:多)
  has_many :tweets


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
