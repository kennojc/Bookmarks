class Type < ApplicationRecord
has_many :bookmarks, dependent: :destroy

def self.hash_for_graph
    bookmarks = Bookmark.all.group(:type).count
    hash_types = {}
    bookmarks.each do |type|
      hash_types[type[0].name] = Type.where(name: type[0].name).count
    end
    hash_types
  end

end
