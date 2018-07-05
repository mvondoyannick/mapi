class Vil < ApplicationRecord
	has_many :market
	mount_uploader :image, ImageUploader
end
