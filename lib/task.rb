class Task < ActiveRecord::Base
  belongs_to(:list)
  validates(:description, {:presence => true, :length => { :maximum => 50 }})
  #callback
  before_save(:downcase_description)

  #method to return a query from the DB of tasks not done
  scope(:not_done, -> do
          where({:done => false})
  end)

  #all method below the private are called by object itself and not other objects
  private

  define_method(:downcase_description) do
    self.description=(description().downcase())
  end
end
