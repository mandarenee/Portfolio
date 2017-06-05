class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      respond_to do |format|
        format.js { render js: "successful_subscribe();" }
      end
    else
      respond_to do |format|
        format.js { render js: "unsuccessful_subscribe();" }
      end
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:first_name, :email)
  end
end
