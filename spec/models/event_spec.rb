require 'rails_helper'

describe Event do

  let(:artist) { User.create!(name: "Pablo Picasso",
                    email: "testing@mail.com",
                    password:"testing1234",
                    statement: "This is the test statement",
                    artist: true,
                    avatar: File.new("#{Rails.root}/public/imgs/favicon125x108.png")) }

  let(:event) { Event.create!(start_time: "2015-10-14 18:06",
                              end_time: "2015-10-14 20:06",
                              event_url: "www.google.com",
                              event_address: "351 W Hubbard St",
                              event_city: "Chicago",
                              event_zip: "60654",
                              host: "Devbootcamp",
                              user_id: artist.id) }

  describe "An event is created and persists to the database" do
    it "An event is an Event object" do
      expect(event).to be_a(Event)
    end

    it "An event has a start time" do
      p event.start_time.class
      expect(event.start_time).to be_a(ActiveSupport::TimeWithZone)
    end

    it "An event has an end time" do
      expect(event.end_time).to be_a(ActiveSupport::TimeWithZone)
    end

    it "An event has an event url" do
      expect(event.event_url).to_not be(nil)
    end

    it "An event has an address" do
      expect(event.event_address).to eq("351 W Hubbard St")
    end

    it "An event has a city" do
      expect(event.event_city).to eq("Chicago")
    end

    it "An event has a zip code" do
      expect(event.event_zip).to eq("60654")
    end

    it "An event has many users that will attend the event" do
      event.users << artist
      expect(event.users.first).to eq(artist)
    end

  end
end
