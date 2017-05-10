require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require_relative("../models/edition.rb")
require_relative("../models/shop.rb")

# INDEX - READ (all)

get "/prices" do
  @editions = Edition.markup()
  erb (:prices)
end



#NEW - CREATE (get form)



#CREATE - CREATE (make something)

#SHOW - READ (one)

#EDIT UPDATE (get form)

#UPDATE UPDATE (make change)

#DESTROY DELETE
