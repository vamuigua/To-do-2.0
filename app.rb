#used bundler to require all gems
require("bundler/setup")
#__FILE__ refers to the current file, and File.dirname(__FILE__) will give the current directory
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
Bundler.require(:default)

get('/') do
  @tasks = Task.all()
  erb(:index)
end

post('/tasks') do
  description =params.fetch('description')
  @task = Task.new({:description => description, :done => false})
  if @task.save()
    erb(:success)
  else
    erb(:errors)
  end
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i())
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:index)
end
