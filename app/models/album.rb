class Album < ApplicationRecord
	belongs_to :user
	has_many :photos, dependent: :destroy
	has_one_attached :image
end
