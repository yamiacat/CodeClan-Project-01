require("pry-byebug")
require_relative("../models/artist.rb")
require_relative("../models/album.rb")
require_relative("../models/edition.rb")

Edition.delete_all()
Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'David Bowie'
  })

artist2 = Artist.new({
  'name' => 'Have A Nice Life'
  })

artist3 = Artist.new({
  'name' => 'Boards of Canada'
  })

artist4 = Artist.new({
  'name' => 'My Bloody Valentine'
  })

artist1.save()
artist2.save()
artist3.save()
artist4.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Diamond Dogs',
  'genre' => 'Glam Rock',
  'original_release_year' => '1974'
  })

album2 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Blackstar',
  'genre' => 'Art Rock',
  'original_release_year' => '2016'
  })

album3 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Deathconsciousness',
  'genre' => 'Blackgaze',
  'original_release_year' => '2008'
  })


album4 = Album.new({
  'artist_id' => artist3.id,
  'title' => 'Geogaddi',
  'genre' => 'Electronic Ambient',
  'original_release_year' => '2002'
  })


album5 = Album.new({
  'artist_id' => artist4.id,
  'title' => 'Loveless',
  'genre' => 'Shoegaze',
  'original_release_year' => '1991'
  })

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()



binding.pry
nil
