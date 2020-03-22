class Post < ApplicationRecord

  validates :content, presence: true,
                      length: {maximum: 140},
                      uniqueness: true

end
