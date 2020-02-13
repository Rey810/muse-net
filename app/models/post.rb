class Post < ApplicationRecord
  belongs_to :user
  has_many :likes,           dependent: :destroy
  has_many :comments,        dependent: :destroy    

  default_scope { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader

  validate :content_or_picture
  validate :picture_size

  private

      # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

    def content_or_picture
      if content.empty? && picture.blank?
        errors.add(:post, "can't be completely empty!")
      end
    end

end
