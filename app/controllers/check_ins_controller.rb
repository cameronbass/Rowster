class CheckInsController < ApplicationController
  def index
    @check_in = Check_In.all
  end

  def show
    @check_in = Check_In.find(params[:id])
  end

  def new
    @check_in = Check_In.new
  end

  def create
   subscriber = Subscriber.find_by(phone_number: params[:phone_number])
   if subscriber
     Check_In.create(visit_amount: subscriber)
   else
     render "new"
   end
 end

  private

  def check_in_params
    params.require(:check_in).permit(:visit_amount)
  end
end
