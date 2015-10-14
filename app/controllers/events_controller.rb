class EventsController < ApplicationController

  def index

  end

  def search
    @city = params[:city]
    @art_events = art_event_results
    @art_events_with_venues = remove_empty_venues(@art_events)
    @results = refine_results(@art_events_with_venues, @city)
  end

  private
  def art_event_results
    params = { category: '1', status: 'upcoming', format: 'json'}
    meetup_api = MeetupApi.new
    events = meetup_api.open_events(params)
    return events["results"]
  end

  def remove_empty_venues(events)
    results = []
    events.each do |event|
      if event["venue"]
        results << event
      end
    end
    return results
  end

  def refine_results(events, city)
    results = []
    events.each do |event|
      if event["venue"]["city"].downcase == city.downcase
        results << event
      end
    end
    return results
  end
end
