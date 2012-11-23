require "recurello"

describe Recurello::Card do
  describe "#new" do
    def options
      return {
        member_name: "Some member name",
        board_name: "Some board name",
        list_name: "Some list name",
        list_id: "3",
        name: "Some name",
        desc: "Some description"
      }
    end

    context "given no options hash" do
      it "sets an empty string as a default for all attributes" do
        card = Recurello::Card.new
        options.keys.all? { |attr| card.send(attr).empty? }.should be_true
      end
    end

    context "given an options hash" do
      it "sets all attributes as defined in the hash" do
        card = Recurello::Card.new(options)
        options.all? { |attr, val| card.send(attr) == val }.should be_true
      end
    end
  end

  describe "#member_name=" do
    it "sets the Trello Member's name" do
      card = Recurello::Card.new
      card.member_name = "Some member name"
      card.member_name.should == "Some member name"
    end
  end

  describe "#board_name=" do
    it "sets the Card's Board's name" do
      card = Recurello::Card.new
      card.board_name = "Some board name"
      card.board_name.should == "Some board name"
    end
  end

  describe "#list_name=" do
    it "sets the Card's List's name" do
      card = Recurello::Card.new
      card.list_name = "Some list name"
      card.list_name.should == "Some list name"
    end
  end

  describe "#list_id=" do
    it "sets the Card's List's id" do
      card = Recurello::Card.new
      card.list_id = 3
      card.list_id.should == 3
    end
  end

  describe "#name=" do
    it "sets the Card's name" do
      card = Recurello::Card.new
      card.name = "Some name"
      card.name.should == "Some name"
    end
  end

  describe "#desc=" do
    it "sets the Card's description" do
      card = Recurello::Card.new
      card.desc = "Some description"
      card.desc.should == "Some description"
    end
  end
end
