class CreateLists < ActiveRecord::Migration[5.1]
  def change
    #create a table called lists
    create_table(:lists) do |t|
      t.column(:name, :string)

      t.timestamps()
    end

    #add a column in the tasks table called list_id with type interger
    add_column(:tasks, :list_id, :integer)
  end
end
