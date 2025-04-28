class Comment < ApplicationRecord
  belongs_to :craft
  belongs_to :user, counter_cache: true
  has_rich_text :body
end
