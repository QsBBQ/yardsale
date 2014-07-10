# If you ever see a Rakefile, run
#
#   rake -T
#
# to get a list of all available "rake commands."

require 'rake'

def prompt(msg)
  print "#{msg} (y/n) "

  case STDIN.gets.chomp.downcase
  when 'y', 'yes'
    :yes
  when 'n', 'no'
    :no
  end
end

namespace :setup do
  desc 'Set up dotenv by copying env.example to .env'
  task :dotenv do
    if File.exist?('.env')
      if prompt('The .env file already exists. Overwrite it?') == :no
        next
      end
    end

    puts "Copying env.example to .env..."

    FileUtils.cp('env.example', '.env')
  end
end

desc 'Start IRB with application environment loaded'
task :console do
  exec 'irb -r./setup -r./database'
end
