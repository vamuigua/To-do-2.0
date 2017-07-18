class Task < ActiveRecord::Base
  belongs_to(:list)

  #validates input for description of a task
  validates(:description, {:presence => true, :length => { :maximum => 50 }})

  #callback function to make the description doencase before  it is saved
  #Callbacks are methods that get called at certain points of an object's life cycle
  before_save(:downcase_description)

  #the scope is a class method that returns an Active Record query result
  #the method returns a query from the DB of tasks not done
  scope(:not_done, -> do
          where({:done => false})
  end)

  #all method below the private are called by object itself and not other objects
  private

  define_method(:downcase_description) do
    self.description=(description().downcase())
  end
end
