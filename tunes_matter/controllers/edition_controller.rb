require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require_relative("../models/edition.rb")


# INDEX - READ (all)

get "/editions" do
  @editions = Edition.all()
  erb (:"editions/index")
end

#NEW - CREATE (get form)

get "/editions/new" do
  @artists = Artist.all()
  @albums = Album.all()
  erb(:"editions/new")
end

#CREATE - CREATE (make something)

post "/editions" do
  @edition = Edition.new(params)
  @edition.save()
  erb(:"editions/create")
end

#SHOW - READ (one)
get "/editions/:id" do
  @edition = Edition.find(params[:id])
  erb(:"editions/show")
end

#EDIT UPDATE (get form)

get "/editions/:id/edit" do
  @albums = Album.all()
  @edition = Edition.find(params[:id])
  erb(:"editions/edit")
end

#UPDATE UPDATE (make change)

post "/editions/:id" do
  @edition = Edition.new(params)
  @edition.update()
  erb(:"editions/update")
end

#WARN DELETE

get "/editions/:id/warn-delete" do
  @edition = Edition.find(params[:id])
  erb(:"editions/warn-delete")
end

#DESTROY DELETE

post "/editions/:id/delete" do
  @edition = Edition.find(params[:id])
  @edition.delete()
  erb(:"editions/destroy")
end
