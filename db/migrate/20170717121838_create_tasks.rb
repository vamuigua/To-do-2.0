class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    #create a table called tasks
    create_table(:tasks) do |t|
      t.column(:description, :string)
      t.column(:done, :boolean)

      t.timestamps()
    end
  end
end
