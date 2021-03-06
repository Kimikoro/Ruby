class Booker < ApplicationRecord
	belongs_to :user

	validates :body, presence: true, length: { maximum: 200 }
	validates :title, presence: true, length: { maximum: 50 }
end
