class List < ActiveRecord::Base
  # The new_list.tasks and new_list.tasks().new() methods are automatically created by
  # Active Record just by adding has_many()
  has_many(:tasks)
end
