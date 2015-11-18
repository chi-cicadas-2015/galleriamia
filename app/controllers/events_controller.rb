class EventsController < ApplicationController

  def index

  end

  def search
    @city = params[:city]
    @city_coordinates = city_coordinates(@city)
    @art_events = art_event_results
    @results = refine_results(@art_events, @city)
  end

  private
  def city_coordinates(city)
    city_info = Geocoder.search(city)
    return "#{city_info[0].coordinates[0]},#{city_info[0].coordinates[1]}"
  end

  def art_event_results
    params = { category: '1', status: 'upcoming', format: 'json'}
    meetup_api = MeetupApi.new
    events = meetup_api.open_events(params)
    return events["results"]
  end

  def refine_results(events, city)
    results = []
    events.each do |event|
      if event["venue"] && event["venue"]["city"].downcase == city.downcase
        results << event
      end
    end
    return results
  end

end
