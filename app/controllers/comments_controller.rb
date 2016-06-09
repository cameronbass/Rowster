class CommentsController < ApplicationController
  def new
    @comments = Comment.new
  end

  def create
    @comments = Comment.create(comments_params)
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
end
