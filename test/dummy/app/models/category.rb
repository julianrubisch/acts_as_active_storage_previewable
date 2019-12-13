class Category < ApplicationRecord
  acts_as_active_storage_previewable_on :thumbnail, :featured_image, default: :featured_image

  has_one_attached :featured_image
  has_one_attached :thumbnail
end
