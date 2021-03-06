require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' # database configuration
require './people/person'
require './events/event'
require './registrations/registration'

after do
  ActiveRecord::Base.clear_active_connections!
end

get '/' do
	erb :index
end

get '/people' do
	@people = Person.all
	erb :people
end

get '/events' do
	@events = Event.all
	erb :events
end

get '/registrations' do
	@registrations = Registration.all
  @people = Person.all
  @events = Event.all
	erb :registrations
end

get '/person/new' do
	erb :add_person
end

get '/event/new' do
	erb :add_event
end

get '/registration/new' do
	erb :add_registration
end

post '/p_submit' do
	@person = Person.new(params[:person])
	if @person.save
		redirect '/people'
	else
		"Sorry, there was an error!"
	end
end

post '/e_submit' do
	@event = Event.new(params[:event])
	if @event.save
		redirect '/events'
	else
		"Sorry, there was an error!"
	end
end

post '/r_submit' do
	@registration = Registration.new(params[:registration])
  if Registration.exists?(:people_id => @registration.people_id, :events_id => @registration.events_id)
    "This registration already exists!"
  else
    if Person.where("person_id=?", @registration.people_id).blank?
      "Sorry this person_id doesn't exist! Please check again!"
    else
      if Event.where("event_id=?", @registration.events_id).blank?
        "Sorry this event_id doesn't exist! Please check again!"
      else
        if @registration.save
          redirect '/registrations'
        else
          "Sorry, there was an error!"
        end
      end
    end
  end
end
