class PopulateCraftCommentsCount < ActiveRecord::Migration[7.2]
  def up
    Craft.find_each do |craft|
      Craft.reset_counters(craft.id, :comments)
    end
  end
end
