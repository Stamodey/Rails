class HomeController < ApplicationController
  def index
    @table = params[:table] || 'photographers'

    case @table
    when 'photographers'
      @records = Photographer.all
    when 'clients'
      @records = Client.all
    when 'services'
      @records = Service.all
    when 'bookings'
      @records = Booking.all
    else
      @records = Photographer.all # По умолчанию показываем photographers
    end
  end
end
