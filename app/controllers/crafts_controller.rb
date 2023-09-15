class CraftsController < ApplicationController
  def index
    @crafts = Craft.all
  end

  def show
    @craft = Craft.find(params[:id])
    @craftimage = CraftImage.find(params[:id])
    @comments = @craft.comments.order(created_at: :desc)
  end

end
