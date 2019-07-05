# Add validation for URL
class Image < ApplicationRecord
  validates :url, presence: true, format: { with: %r{(http(s?):)([\/|.|\w|\s|-])*\.(?:jpg|gif|png)},
                                            message: 'needs to be a valid image URL' }
  acts_as_taggable_on :tags
end
