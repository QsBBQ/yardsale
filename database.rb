# We point DataMapper to the correct database in setup.rb
require './setup'

# Listings and Categories are in a 1-to-many (or 1-to-N) relationship:
#   Every listing belongs to one and only one category
#   Every category has many (or "has N") listings
class Listing
  include DataMapper::Resource

  property :id,          Serial
  property :title,       String,   :required => true
  property :price,       Integer
  property :description, Text,     :required => true
  property :created_at,  DateTime, :required => true
  property :updated_at,  DateTime, :required => true

  # Every listing belongs to a category and you can't have a listing without
  # a category. Note: technically "belongs_to" defaults to :required => true,
  # so our use of :required => true here is redundant.  We're being explicit
  # for transparency's sake.
  belongs_to :category, :required => true
end

class Category
  include DataMapper::Resource

  property :id,   Serial
  property :name, String, :required => true, :unique_index => true
  # :unique_index => true ensures that no two categories have the same name

  # Every category has many (or "has N") listings
  has n, :listings
end

# These two lines tell DataMapper that you've defined all your models; and to
# prepare the database for writing and reading. It also makes sure the databases
# `schema` (or "structure" or "shape") matches the `DataMapper::Resource`s
# you've defined above.
DataMapper.finalize
DataMapper.auto_upgrade!
