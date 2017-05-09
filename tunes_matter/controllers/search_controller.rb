require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require_relative("../models/edition.rb")

# INDEX - READ (all)

get "/search" do
  erb (:search)
end

post "/search/artists" do
  @artists = Artist.name_search(params['name'])
  erb (:"artists/index")
end

post "/search/albums" do
  @albums = Album.title_search(params['title'])
  erb (:"albums/index")
end

post "/search/genres" do
  @albums = Album.genre_search(params['genre'])
  erb (:"albums/index")
end


#NEW - CREATE (get form)

get "/searches/new" do

  erb(:"searches/new")
end

#CREATE - CREATE (make something)

#SHOW - READ (one)

#EDIT UPDATE (get form)

#UPDATE UPDATE (make change)

#DESTROY DELETE
