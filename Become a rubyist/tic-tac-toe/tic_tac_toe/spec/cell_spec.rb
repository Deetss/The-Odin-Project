#spec/cell_spec.rb
require "spec_helper"

module TicTacToe
  describe Cell do

    context "#initialize" do
      it "is initialized with a value of '' by default" do
        cell = Cell.new
        expect(cell.value).to eq ''
      end
      it "is initialized with marked as false" do
        cell = Cell.new
        expect(cell.marked).to be false
      end
      it "can be initialized with a value of 'X'" do
        cell = Cell.new("X")
        expect(cell.value).to eq "X"
      end
    end

  end
end
