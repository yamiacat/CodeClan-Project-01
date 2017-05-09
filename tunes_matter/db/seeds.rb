require("pry-byebug")
require_relative("../models/artist.rb")
require_relative("../models/album.rb")
require_relative("../models/edition.rb")
require_relative("../models/shop.rb")

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

artist5 = Artist.new({
  'name' => 'Iron Maiden'
  })

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()

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

album6 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Voids',
  'genre' => 'Blackgaze',
  'original_release_year' => '2009'
  })

album7 = Album.new({
  'artist_id' => artist3.id,
  'title' => 'Music Has The Right To Children',
  'genre' => 'Electronic Ambient',
  'original_release_year' => '1998'
  })

album8 = Album.new({
  'artist_id' => artist3.id,
  'title' => 'Tomorrows Harvest',
  'genre' => 'Electronic Ambient',
  'original_release_year' => '2013'
  })


album9 = Album.new({
  'artist_id' => artist3.id,
  'title' => 'Somewhere in Time',
  'genre' => 'Heavy Metal',
  'original_release_year' => '1986'
  })

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()
album7.save()
album8.save()
album9.save()

edition1 = Edition.new({
  'title_id' => album1.id,
  'format' => 'vinyl',
  'version_notes' => 'original pressing',
  'edition_release_year' => '1974',
  'number_in_stock' => '1',
  'supplier_price' => '2000',
  'retail_price' => '3200'
  })

edition2 = Edition.new({
  'title_id' => album1.id,
  'format' => 'cd',
  'version_notes' => 'bonus disc 2cd version',
  'edition_release_year' => '2004',
  'number_in_stock' => '3',
  'supplier_price' => '1000',
  'retail_price' => '1500'
  })


edition3 = Edition.new({
  'title_id' => album2.id,
  'format' => 'cd',
  'version_notes' => '',
  'edition_release_year' => '2016',
  'number_in_stock' => '4',
  'supplier_price' => '800',
  'retail_price' => '1100'
  })


edition4 = Edition.new({
  'title_id' => album3.id,
  'format' => 'cd',
  'version_notes' => 'double album',
  'edition_release_year' => '2008',
  'number_in_stock' => '1',
  'supplier_price' => '1300',
  'retail_price' => '1600'
  })

edition5 = Edition.new({
  'title_id' => album3.id,
  'format' => 'vinyl',
  'version_notes' => 'double album',
  'edition_release_year' => '2014',
  'number_in_stock' => '3',
  'supplier_price' => '1650',
  'retail_price' => '2100'
  })

edition6 = Edition.new({
  'title_id' => album4.id,
  'format' => 'cd',
  'version_notes' => '',
  'edition_release_year' => '2006',
  'number_in_stock' => '2',
  'supplier_price' => '850',
  'retail_price' => '1100'
  })

edition7 = Edition.new({
  'title_id' => album4.id,
  'format' => 'vinyl',
  'version_notes' => 'double album',
  'edition_release_year' => '2013',
  'number_in_stock' => '3',
  'supplier_price' => '1300',
  'retail_price' => '1900'
  })

edition8 = Edition.new({
  'title_id' => album5.id,
  'format' => 'cd',
  'version_notes' => 'remastered, with bonus disc',
  'edition_release_year' => '2014',
  'number_in_stock' => '3',
  'supplier_price' => '900',
  'retail_price' => '1400'
  })

edition9 = Edition.new({
  'title_id' => album5.id,
  'format' => 'vinyl',
  'version_notes' => 'original pressing',
  'edition_release_year' => '1991',
  'number_in_stock' => '1',
  'supplier_price' => '5000',
  'retail_price' => '25000'
  })

edition10 = Edition.new({
  'title_id' => album6.id,
  'format' => 'vinyl',
  'version_notes' => 'original pressing',
  'edition_release_year' => '2013',
  'number_in_stock' => '10',
  'supplier_price' => '1200',
  'retail_price' => '1650'
  })

edition11 = Edition.new({
  'title_id' => album6.id,
  'format' => 'cd',
  'version_notes' => 'digipak edition',
  'edition_release_year' => '2013',
  'number_in_stock' => '8',
  'supplier_price' => '1000',
  'retail_price' => '1400'
  })

edition12 = Edition.new({
  'title_id' => album6.id,
  'format' => 'cd',
  'version_notes' => 'jewel case edition',
  'edition_release_year' => '2013',
  'number_in_stock' => '9',
  'supplier_price' => '1000',
  'retail_price' => '1400'
  })

edition13 = Edition.new({
  'title_id' => album7.id,
  'format' => 'vinyl',
  'version_notes' => 'original pressing',
  'edition_release_year' => '1998',
  'number_in_stock' => '11',
  'supplier_price' => '1200',
  'retail_price' => '2650'
  })

edition14 = Edition.new({
  'title_id' => album8.id,
  'format' => 'cd',
  'version_notes' => 'digipak edition with bonus tracks',
  'edition_release_year' => '2016',
  'number_in_stock' => '4',
  'supplier_price' => '1000',
  'retail_price' => '1400'
  })

edition15 = Edition.new({
  'title_id' => album8.id,
  'format' => 'vinyl',
  'version_notes' => 'red and cream picture disc',
  'edition_release_year' => '2013',
  'number_in_stock' => '2',
  'supplier_price' => '1900',
  'retail_price' => '2400'
  })

  edition16 = Edition.new({
    'title_id' => album9.id,
    'format' => 'cd',
    'version_notes' => 'remastered',
    'edition_release_year' => '1998',
    'number_in_stock' => '0',
    'supplier_price' => '900',
    'retail_price' => '1100'
    })


edition1.save()
edition2.save()
edition3.save()
edition4.save()
edition5.save()
edition6.save()
edition7.save()
edition8.save()
edition9.save()
edition10.save()
edition11.save()
edition12.save()
edition13.save()
edition14.save()
edition15.save()
edition16.save()

binding.pry
nil
