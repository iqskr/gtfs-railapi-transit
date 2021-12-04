class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :show_trips, :show_calendar_dates]

  # GET /calendars
  def index
    if params[:date]
      begin
        date = Date.parse(params[:date])
        render json: paginate_results(Calendar.active_on_date(date))
      rescue ArgumentError
        raise 'Invalid date.'
      end
    else
      render json: paginate_results(Calendar.all)
    end
  end

  # GET /calendars/1
  def show
    render json: @calendar
  end

  # GET /calendars/1/trips
  def show_trips
    render json: paginate_results(@calendar.trips)
  end

  # GET /calendars/1/calendar_dates
  def show_calendar_dates
    render json: paginate_results(@calendar.calendar_dates)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calendar
    @calendar = Calendar.find_by_service_gid(params[:service_gid])
    raise ActionController::RoutingError.new('Not Found') if @calendar.nil?
  end
end
