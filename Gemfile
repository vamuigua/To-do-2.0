source("https://rubygems.org")

#when calling sinatra/reloader we are refering to tools used in sinatra-contrib
gem("sinatra-contrib", :require => "sinatra/reloader")
gem("sinatra-activerecord")
gem("rake")
gem("pg")
gem("sinatra")

#required only during testing
group(:test) do
  gem("rspec")
  gem("capybara")
  gem("pry")
end
