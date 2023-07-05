class Book
  include Mongoid::Document

  field :title, type: String
  field :author, type: String

  # include Mongoid::Timestamps
end
