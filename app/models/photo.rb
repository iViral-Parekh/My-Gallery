class Photo < ApplicationRecord
	belongs_to :album
	has_one_attached :image

	validate :image_count
	validate :image_presence

	def image_presence
    errors.add(:image, "Image can't be blank") unless image.attached?
  end

  def image_count
  	errors.add(:image, "can't upload more than 25 images in an album") unless (Album.find(album_id).photos.count < 25)
  end
end
