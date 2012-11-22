require "recurello"

describe Recurello::TrelloAPI do
  it { should respond_to(:authorize) }

  describe "#member" do
    it "returns a Member class" do
      trello = Recurello::TrelloAPI.new
      result = trello.member
      result.should be_a(Class)
      result.name.should == "Trello::Member"
    end
  end

  it { should respond_to(:create_card) }
end
