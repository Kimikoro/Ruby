class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 200 }

  has_many :bookers
  attachment :profile_image

end
