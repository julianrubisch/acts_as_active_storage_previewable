class Topic < ApplicationRecord
  has_one_attached :featured_image
  has_one_attached :other_attachment

  acts_as_active_storage_previewable
end
