require_relative("../db/sql_runner.rb")
require_relative("./album.rb")
require_relative("./edition.rb")

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(params)
    @id = params['id'].to_i()
    @name = params['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;"
    returned_result = SqlRunner.run(sql)
    @id = returned_result.first()['id'].to_i()
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end



end
