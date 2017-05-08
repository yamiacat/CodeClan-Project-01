require("sinatra")
require("sinatra/contrib/all")
require_relative("./album_controller.rb")
require_relative("../models/artist.rb")
require_relative("../models/album.rb")

# INDEX - READ (all)

get "/artists" do
  @artists = Artist.all()
  erb (:"artists/index")
end

#NEW - CREATE (get form)

get "/artists/new" do
  erb(:"artists/new")
end

#CREATE - CREATE (make something)

post "/artists" do
  @artist = Artist.new(params)
  @artist.save()
  erb(:"artists/create")
end

#SHOW - READ (one)
get "/artists/:id" do
  @artist = Artist.find(params[:id])
  @albums = @artist.all_albums()
  erb(:"artists/show")
end

#EDIT UPDATE (get form)

get "/artists/:id/edit" do
  @artist = Artist.find(params[:id])
  erb(:"artists/edit")
end

#UPDATE UPDATE (make change)

post "/artists/:id" do
  @artist = Artist.new(params)
  @artist.update()
  erb(:"artists/update")
end

#DESTROY DELETE

post "/artists/:id/delete" do
  @artist = Artist.find(params[:id])
  @artist.delete()
  erb(:"artists/destroy")
end
