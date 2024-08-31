class BookingsController < ApplicationController
    def new
        @flight = Flight.find(params[:selected_flight_id])
        @booking = Booking.new
        @number_of_passengers = params[:number_of_passengers].to_i
        @number_of_passengers.times { @booking.passengers.build }
    end


    def create
        @booking = Booking.new(booking_params)

        if @booking.save
            redirect_to @booking, notice: "Booking was successfully created."
        else
            render :new
        end 
    end

    def show
        @booking = Booking.find(params[:id])
        @flight = @booking.flight
        @number_of_passengers = @booking.passengers.count
    end




    private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
