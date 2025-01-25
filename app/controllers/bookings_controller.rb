# class BookingsController < ApplicationController
#   def index
#     @bookings = Booking.includes(:photographer, :client, :service).page(params[:page]).per(8)
#   end

#   def new
#     @booking = Booking.new
#     @photographers = Photographer.all
#     @clients = Client.all
#     @services = Service.all
#   end

#   def create
#     @booking = Booking.new(booking_params)
#     if @booking.save
#       redirect_to bookings_path, notice: 'Booking was successfully created.'
#     else
#       @photographers = Photographer.all
#       @clients = Client.all
#       @services = Service.all
#       render 'new'
#     end
#   end

#   def edit
#     @booking = Booking.find(params[:id])
#     @photographers = Photographer.all
#     @clients = Client.all
#     @services = Service.all
#   end

#   def update
#     @booking = Booking.find(params[:id])
#     if @booking.update(booking_params)
#       redirect_to bookings_path, notice: 'Booking was successfully updated.'
#     else
#       render 'edit'
#     end
#   end

#   def destroy
#     @booking = Booking.find(params[:id])
#     @booking.destroy
#     redirect_to bookings_path, notice: 'Booking was successfully deleted.'
#   end

#   private

#   def booking_params
#     params.require(:booking).permit(:booking_date, :photographer_id, :client_id, :service_id, :status)
#   end
# end
class BookingsController < ApplicationController
  def index
    @bookings = Booking.includes(:photographer, :client, :service).page(params[:page]).per(8)
  end

  def new
    @booking = Booking.new
    @photographers = Photographer.all
    @clients = Client.all
    @services = Service.all
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      @photographers = Photographer.all
      @clients = Client.all
      @services = Service.all
      render 'new'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @photographers = Photographer.all
    @clients = Client.all
    @services = Service.all
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Booking was successfully updated.'
    else
      @photographers = Photographer.all
      @clients = Client.all
      @services = Service.all
      render 'edit'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully deleted.'
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :photographer_id, :client_id, :service_id, :status)
  end
end
