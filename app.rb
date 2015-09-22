require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' # database configuration
require './persons/person'
require './events/event'
require './registrations/registration'

get '/' do
	erb :index
end

get '/persons' do
	@persons = Person.all
	erb :persons
end

get '/events' do
	@events = Event.all
	erb :events
end

get '/registrations' do
	@registration = Registration.all
	erb :registrations
end

post '/p_submit' do
	@person = Person.new(params[:person])
	if @person.save
		redirect '/persons'
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
	if @registration.save
		redirect '/registrations'
	else
		"Sorry, there was an error!"
	end
end
