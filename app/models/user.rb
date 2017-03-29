class User < ApplicationRecord
	has_many :rooms, through: :messages
	has_many :messages
end
