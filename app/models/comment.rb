class Comment < ApplicationRecord
  belongs_to :craft
  belongs_to :user
  has_rich_text :body
end
