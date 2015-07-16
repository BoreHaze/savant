class Song < ActiveRecord::Base
  validates :title, :artist_id, :contents, presence: true
  validates :title, uniqueness: {scope: :artist_id}

  belongs_to :artist

  has_many :song_fragments
end
