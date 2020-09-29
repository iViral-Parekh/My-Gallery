class Photo < ApplicationRecord
	belongs_to :album
	has_one_attached :image

	validate :image_count

  def image_count
  	errors.add(:image, "can't upload more than 25 images in an album") unless (Album.find(album_id).photos.count < 25)
  end
end
