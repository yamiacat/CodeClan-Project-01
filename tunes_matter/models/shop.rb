require_relative("./artist.rb")
require_relative("./edition.rb")
require_relative("./album.rb")


class Shop

  def Shop.total_stock_levels
    total_artists = Artist.all()
    total_albums = Album.all()
    total_editions = Edition.all()

    return "Tunes Matter currently has #{total_albums.count} albums in #{total_editions.count} specific editions by #{total_artists.count} unique artists."
  end


  # def Shop.search
  #
  # end

end
