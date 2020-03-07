
class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def note_contents=(contents)
    contents.each do |content|
      note= Note.create(content: content)
      self.notes << note
    end
  end
  

end
