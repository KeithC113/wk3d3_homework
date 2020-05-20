require('pg')
require_relative('../db/sql_runner')


class Album

  attr_accessor :title, :artist, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @artist = options['artist']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @id = options['id'].to_i if options['id']
  end

# =>  creating the artist id
  def artist()
    sql = "SELECT * FROM artist WHERE artist_id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql,values)
    artist_data = results[0]
    artist = Artist.new(artist_data)
  end

# =>  adding the album into the table
  def save()
    sql = "INSERT INTO albums (
    title, artist,genre, artist_id)
    VALUES
    ( $1, $2, $3, $4)
     RETURNING id"
     values = [@title, @artist,@genre,@artist_id]
     returned_array = SqlRunner.run(sql,values)
     album_hash = returned_array[0]
     @id = album_hash['id'].to_i
   end
end
