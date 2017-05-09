require_relative("../db/sql_runner.rb")
require_relative("./artist.rb")
require_relative("./edition.rb")

class Album

  attr_reader :id
  attr_accessor :artist_id, :title, :genre, :original_release_year

  def initialize(params)
    @id = params['id'].to_i()
    @artist_id = params['artist_id'].to_i()
    @title = params['title'].downcase
    @genre = params['genre'].downcase
    @original_release_year = params['original_release_year'].to_i()
  end

  def save()
    sql = "INSERT INTO albums (artist_id, title, genre, original_release_year) VALUES (#{@artist_id}, '#{@title}', '#{@genre}', #{@original_release_year}) RETURNING id;"
    returned_result = SqlRunner.run(sql)
    @id = returned_result.first()['id'].to_i()
  end

  def Album.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def Album.all()
    sql = "SELECT * FROM albums ORDER BY title ASC;"
    returned_result = SqlRunner.run(sql)
    return returned_result.map{|album| Album.new(album)}
  end

  def Album.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id}"
    returned_result = SqlRunner.run(sql)
    return Album.new(returned_result.first())
  end

  def update()
    sql = "UPDATE albums SET (artist_id, title, genre, original_release_year) = (#{@artist_id}, '#{@title}', '#{@genre}', #{@original_release_year}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    returned_result = SqlRunner.run(sql)
    return Artist.new(returned_result.first())
  end

  def all_editions()
    sql = "SELECT * FROM editions WHERE title_id = #{@id} ORDER BY edition_release_year ASC;"
    returned_result = SqlRunner.run(sql)
    return returned_result.map {|edition| Edition.new(edition) }
  end

  def Album.title_search(search_string)
    sql = "SELECT * FROM albums WHERE title LIKE '%#{search_string}%';"
    returned_result = SqlRunner.run(sql)
    return returned_result.map{|album| Album.new(album)}
  end


  def Album.genre_search(search_string)
    sql = "SELECT * FROM albums WHERE genre LIKE '%#{search_string}%';"
    returned_result = SqlRunner.run(sql)
    return returned_result.map{|album| Album.new(album)}
  end

end
