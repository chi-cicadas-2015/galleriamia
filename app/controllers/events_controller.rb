class EventsController < ApplicationController

  def index

  end

  def search
    @zip = params[:zip]
    @distance = params[:distance]
    @art_events = art_event_results(@zip, @distance)
  end

  private
  def art_event_results(zip, distance)
    client = RMeetup::Client.new do |config|
      config.api_key = "166a4221b4a63615538543733d29"
    end

    results = client.fetch(:open_events,{:zip => zip, :distance => distance})
  end
end
