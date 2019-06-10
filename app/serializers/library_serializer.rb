class LibrarySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :alive

  belongs_to :user
  belongs_to :catalogue
end
