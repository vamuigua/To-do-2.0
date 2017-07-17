ENV['RACK_ENV'] = 'test'

#require the same files and gems
require("rspec")
require("pg")
require("sinatra/activerecord")
require("task")
require("list")


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
