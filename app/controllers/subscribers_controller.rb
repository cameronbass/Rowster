class SubscribersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @search = Subscriber.search(params[:q])
    @subscriber = @search.result
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
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
      @subscriber.visit ||= 0
      @subscriber.visit += 1
      @subscriber.save
      render "visit"
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:first_name, :last_name, :email, :phone_number)
  end

  def sort_column
    Subscriber.column_names.include?(params[:sort]) ? params[:sort] : "visit"
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : "asc"
  end
end
