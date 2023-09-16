class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @craft.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment created"
      redirect_to craft_path(@craft)
    else
      flash[:alert] = "Comment couldn't be added"
      redirect_to craft_path(@craft)
    end
  end

  def destroy
    @comment = @craft.comments.find(params[:id])
    @comment.destroy
    redirect_to craft_path(@craft)
  end

  def update
    @comment = @craft.comments.find(params[:id])
    
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to craft_url(@craft), notice: "Comment has been updated." }
      else
        format.html { redirect_to craft_url(@craft), alter: "Comment could not be updated!" }
      end
    end

  end

  private

  def set_post
    @craft = Craft.find(params[:craft_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
