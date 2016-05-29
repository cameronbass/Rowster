class Subscribers::VisitsController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.find_by_phone_number(params[:phone_number])
    if @subscriber
      @subscriber.visit += 1
      @subscriber.save
      redirect_to subscribers_visits_new_path(:subscriber)
    else
      render "new"
    end
  end
end
