require_relative("../db/sql_runner.rb")
require_relative("./artist.rb")
require_relative("./edition.rb")

class Album

  attr_reader :id
  attr_accessor :artist_id, :title, :genre, :original_release_year

  def initialize(params)
    @id = params['id'].to_i()
    @artist_id = params['artist_id'].to_i()
    @title = params['title']
    @genre = params['genre']
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


end
