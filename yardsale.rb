# setup.rb makes sure we're setting up our environment correctly, i.e.,
# requiring the necessary gems, connecting to the correct database, etc.
require './setup'

# database.rb is where we're defining our DataMapper models
require './database'

# The home page
get '/' do
  erb :index
end

## Listings
# Show a specific listing
get '/listings/:id' do
  erb :show_listing
end

# Show a "new listing" form
get '/listings/new' do
  erb :new_listing
end

# Create a new listing
post '/listings' do
end

# Show an "edit existing listing" form
get '/listings/:id/edit' do
  erb :edit_listing
end

# Update an existing listing
put '/listings/:id' do
end

# Delete an existing listing
delete '/listings/:id' do
end

## Categories
# Show all listings in a given category
get '/categories/:id' do
  erb :show_category
end

# Show a "new category" form
get '/categories/new' do
  erb :new_category
end

# Create a new category
post '/categories' do
end

# Show an "edit existing category" form
get '/categories/:id/edit' do
  erb :edit_category
end

# Update an existing category
put '/categories/:id' do
end

# Delete an existing category
delete '/categories/:id' do
end
