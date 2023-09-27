class ProfileController < ApplicationController

  def index
    @userComment = current_user.comments
    @craft = Craft.all
  end

  private 

  def find_comment
    puts "hello"
  end
end
