class Flat < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
