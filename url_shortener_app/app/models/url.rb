class Url < ApplicationRecord
  VALID_URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(\/.*)?\z/ix
  validates :full_url, presence: true, uniqueness: true, format: { with: VALID_URL_REGEX }

  def shorten(full_url)

  end
end
