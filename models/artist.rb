require_relative('../db/sql_runner')
require_relative('./album.rb')


class Artist
  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @id = options['id'].to_i if options['id']
  end

  # =>  creating the album id
    def artist()
      sql = "SELECT * FROM albums WHERE artist_id = $1"
      values = [@id]
      results = SqlRunner.run(sql,values)
      artist_data = results[0]
      artist = Artist.new(artist_data)
    end

  # =>  adding the album into the table
    def save()
      sql = "INSERT INTO artists(
      first_name, last_name)
      VALUES
      ( $1, $2)
       RETURNING id"
       values = [@first_name, @last_name]
       returned_array = SqlRunner.run(sql,values)
       artist_hash = returned_array[0]
       @id = artist_hash['id'].to_i
     end

     def self.all()
      sql = "SELECT * FROM artists"
      artists = SqlRunner.run(sql)
      return artists.map { |artist| Artist.new(artist)}
    end

end
