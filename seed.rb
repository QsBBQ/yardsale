require './setup'
require './database'

def create_category(name)
  puts "Creating category: \"#{name}\""
  Category.create(:name => name)
end

create_category('Electronics')
create_category('Books')
create_category('DVDs & Video')
create_category('Services')
