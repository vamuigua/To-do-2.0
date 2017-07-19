require('spec_helper')

describe(List) do
  describe("#tasks") do
    it { should tell us how many tasks are recorded(:tasks) }
  end
  describe("tasks") do
    it { should have_many(:tasks) }
  end
end
