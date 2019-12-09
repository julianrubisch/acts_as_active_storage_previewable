class Post < ApplicationRecord
  has_one_attached :featured_image
  has_many_attached :downloads

  acts_as_active_storage_previewable
end
