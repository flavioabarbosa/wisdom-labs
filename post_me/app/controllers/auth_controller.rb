class AuthController < ApplicationController

require "koala"

def new

	Koala.http_service.http_options = {:ssl => {:ca_file => "/Users/flaviobarbosa/Documents/Development/Ruby/cacert.pem"}}
	api_key = "387585521369687"
	app_secret = "7b2493b3bf37130b956fc9816f21ed76"
	callback_url = "http://0.0.0.0:3000/auth/create/"
	@oauth = Koala::Facebook::OAuth.new(api_key, app_secret, callback_url)

end

def create

	Koala.http_service.http_options = {:ssl => {:ca_file => "/Users/flaviobarbosa/Documents/Development/Ruby/cacert.pem"}}
	api_key = "387585521369687"
	app_secret = "7b2493b3bf37130b956fc9816f21ed76"
	callback_url = "http://0.0.0.0:3000/auth/create/"
	@oauth = Koala::Facebook::OAuth.new(api_key, app_secret, callback_url)
	token = @oauth.get_access_token(params[:code])
	@graph = Koala::Facebook::GraphAPI.new(token)
  	
  	@profile = @graph.get_object( "me" )
  	@user = User.new( { name: @profile["name"], age: Date.strptime(@profile["birthday"], '%m/%d/%Y'), id_face: @profile["id"], surname: @profile["last_name"], 
  	 					email: @profile["email"], id_face: @profile["id"], updated_at: @profile["updated_time"] })
  	@user.save
  	
  	@books = @graph.get_object( "me/books")
  	@books.each do |book|
		@book = Book.new( { name: book["name"], id_book: book["id"], updated_at: book["created_time"] } )
	@book.save
	end



end

def show

end
end
