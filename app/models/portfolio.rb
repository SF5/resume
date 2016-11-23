class Portfolio < ApplicationRecord
    mount_uploader :image, ImageUploader
    default_scope { order(created_at: :desc) }
end
