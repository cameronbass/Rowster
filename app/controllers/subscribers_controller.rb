class SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.create(subscriber_params)
    if @subscriber.save
      flash[:success] = "Subscriber Has Been Created"
    else
      render "new"
    end
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:first_name, :last_name, :email)
  end
end
