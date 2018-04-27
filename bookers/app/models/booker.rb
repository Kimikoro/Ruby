class Booker < ApplicationRecord
	belongs_to :user

	validates :body, length: { in: 1..200 }
	validates :title, length: { in: 1..50 }
end
