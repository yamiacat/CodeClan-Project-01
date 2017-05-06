require("sinatra")
require("sinatra/contrib/all")
require_relative("controllers/album_controller.rb")
require_relative("controllers/artist_controller.rb")
require_relative("controllers/edition_controller.rb")
require_relative("models/shop.rb")

get '/' do
  erb( :index )
end