class CommentsController < ApplicationController
  def new
    @comments = Comments.new
  end

  def create
    @comments = Comments.create(comments_params)
    if @comments.save
      flash[:notice] = "Subscriber Has Been Successfully Created"
      redirect_to new_subscriber_path(:comments)
    else
      render "new"
    end
  end

  private

  def comments_params
    params.require(:comments).permit(:description, :fav_drink, :visit_time)
end
