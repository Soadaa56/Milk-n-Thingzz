class Comment < ApplicationRecord
  belongs_to :craft, counter_cache: true
  belongs_to :user
  has_rich_text :body
end
