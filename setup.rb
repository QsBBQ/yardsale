require 'sinatra'

# The code below will automatically require all the gems listed in our Gemfile,
# so we don't have to manually require gems a la
#
#   require 'data_mapper'
#   require 'dotenv'
#
# See: http://bundler.io/sinatra.html

require 'rubygems'
require 'bundler/setup'
# This requires all gems necessary regardless of environment (:default)
# and any environment-specific gems.
Bundler.require(:default, Sinatra::Application.environment)

# *Note*
#  Sinatra::Application.environment is set to the value of ENV['RACK_ENV']
#  if RACK_ENV is set.  Otherwise, it defaults to :development.

# Load the .env file if it exists
if File.exists?('.env')
  Dotenv.load('.env')
end

# Yell at the user (and exit) if DATABASE_URL isn't set
unless ENV.has_key?('DATABASE_URL')
  puts "ENV['DATABASE_URL'] is undefined.  Make sure your .env file is correct."
  puts "To use the example file env.example, run"
  puts ""
  puts "  rake setup:dotenv"
  puts ""
  puts "or"
  puts ""
  puts "  cp env.example .env"
  puts ""
  exit 1
end

# In development, the DATABASE_URL environment variable should be defined in the
# '.env' file. In production, Heroku will set this environment variable for you.
DataMapper.setup(:default, ENV['DATABASE_URL'])

# Display DataMapper debugging information in development
if Sinatra::Application.development?
  DataMapper::Logger.new($stdout, :debug)
end
