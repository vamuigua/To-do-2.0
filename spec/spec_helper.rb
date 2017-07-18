ENV['RACK_ENV'] = 'test'

#gems in the :test group will only be loaded by spec_helper
require("bundler/setup")
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

#set up RSpec to clean the database between test runs
RSpec.configure do |config|
  config.after(:each) do
    Task.all().each do |task|
      #destroy method made to remove entries in the DB
      task.destroy()
    end
    List.all().each do |list|
      list.destroy()
    end
  end
end
