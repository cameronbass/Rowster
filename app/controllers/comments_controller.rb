class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @subscriber = Subscriber.order('updated_at desc').first
    @comment = @subscriber.comments.build(comments_params)
    if @comment.save
      flash[:notice] = "Thank you!"
      redirect_to subscribers_search_path(:comments)
    else
      render "new"
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:fav_drink, :subscriber_id)
  end
end
