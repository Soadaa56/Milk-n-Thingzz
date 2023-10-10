class CraftsController < ApplicationController
  def index
    @crafts = Craft.all
  end

  def show
    @craft = Craft.find(params[:id])
    @craftimage = CraftImage.find(params[:id])
    @comments = @craft.comments.includes(:user, :rich_text_body).order(created_at: :desc)
  end

end
