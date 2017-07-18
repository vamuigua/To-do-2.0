#used bundler to require all gems
require("bundler/setup")
#__FILE__ refers to the current file, and File.dirname(__FILE__) will give the current directory
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @tasks = Task.all()
  erb(:index)
end

#post request to post new_task created, save task and redirect to new_task
post ('/tasks')
@new_task = Task.new(params.fetch("task"))
if @new_task.save()
  redirect("/tasks/".concat(@new_task.id().to_s()))
else
  erb(:index)
end
end

#get the new_task created
get('/tasks/:id') do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task)
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
