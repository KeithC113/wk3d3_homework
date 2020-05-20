 require('pry')
 require_relative('../models/album')
 require_relative('../models/artist')

# =>  delete all records of albums
# Album.delete_all()
#
# # => delete all artists
# Artist.delete_all()

# => artist object for Ruby
artist1 = Artist.new({
  'first_name' => 'The',
  'last_name' => 'Rolling Stones'})

artist2 = Artist.new({
    'first_name' => 'Public',
    'last_name' => 'Enemy'})

artist3 = Artist.new({
    'first_name' => 'Franz',
    'last_name' => 'Ferdinand'})

# =>  add the albums to the album table
artist1.save()
artist2.save()
artist3.save()

# => album objects for ruby
album1 = Album.new({
  'title' => 'Blue & Lonesome',
  'artist' => 'The Rolling Stones',
  'genre' => 'Rock',
  'artist_id' => artist1.id})

album2 = Album.new({
  'title' => 'Public Enemy No1',
  'artist' => 'Public Enemy',
  'genre' => 'Rap',
  'artist_id' => artist2.id})

album3 = Album.new({
    'title' => 'Right Thoughts...',
    'artist' => 'Franz Ferdinand',
    'genre' => 'Indie',
    'artist_id' => artist3.id})

# # =>  add the albums to the album table
album1.save()
album2.save()
album3.save()

binding.pry
nil
