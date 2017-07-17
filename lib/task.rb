class Task < ActiveRecord::Base
  belongs_to(:list)
  validates(:description, {:presence => true, :length => { :maximum => 50 }})

  #method to return a query from the DB of tasks not done
  scope(:not_done, -> do
          where({:done => false})
  end)
end
