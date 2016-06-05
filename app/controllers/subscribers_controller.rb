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
      flash[:notice] = "Subscriber Has Been Successfully Created"
      redirect_to new_subscriber_path(:subscriber)
    else
      render "new"
    end
  end

  def search
    @subscriber = Subscriber.new
  end

  def visit
    @subscriber = Subscriber.find_by_phone_number(params[:phone_number])
    if @subscriber
      @subscriber.visit += 1
      @subscriber.save
      flash[:notice] = flash[:notice] = "Thank You #{@subscriber.first_name}. You have #{@subscriber.days_till_expired} until renewal"
      redirect_to subscribers_search_path(:subscriber)
    else
      render "search"
    end
  end


  private

  def subscriber_params
    params.require(:subscriber).permit(:first_name, :last_name, :email, :phone_number)
  end

  def sort_column
    Person.column_names.include?(params[:sort]) ? params[:sort] : "visit"
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : "asc"
  end
end
