class Book
  include Mongoid::Document

  field :title, type: String
  field :author, type: String
  field :publication_date, type: Date
  field :description, type: String
  # field :cover_image, type: String
  # field :categories, type: Array, default: []

  # include Mongoid::Timestamps
end
