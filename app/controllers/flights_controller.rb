class FlightsController < ApplicationController
    def index
        @airports = Airport.all.pluck(:code, :id)
        @flight_dates = Flight.select(:start_datetime).distinct.map { |f| f.start_datetime.to_date }.uniq
        
        if params[:departure_airport_id].present? && params[:arrival_airport_id].present? && params[:flight_date].present?
            @flights = Flight.where(
                departure_airport_id: params[:departure_airport_id],
                arrival_airport_id: params[:arrival_airport_id],
                start_datetime: params[:flight_date].to_date.all_day
            )
        else
            @flights = []
        end
    end


    private 
    
    def flight_params
        params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :start_datetime, :duration)
    end 
end
