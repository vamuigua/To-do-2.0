class Task < ActiveRecord::Base

  #method to return a query from the DB of tasks not done
  scope(:not_done, -> do
          where({:done => false})
  end)
end
