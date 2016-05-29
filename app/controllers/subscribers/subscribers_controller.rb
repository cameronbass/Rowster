class SubscribersController < ApplicationController
  def index
    @subscriber = Subscriber.all
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.create(subscriber_params)
    if @subscriber.save
      flash[:success] = "Subscriber Has Been successfully Created"
      redirect_to new_subscriber_path(:subscriber)
    else
      render "new"
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:first_name, :last_name, :email, :phone_number)
  end
end
