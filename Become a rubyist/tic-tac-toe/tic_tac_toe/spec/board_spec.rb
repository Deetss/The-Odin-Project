require "spec_helper"

module TicTacToe
  describe Board do

    context "#initialize" do
      it "initializes the board with a grid" do
        expect { Board.new(grid: "grid") }.to_not raise_error
      end
    end

    context "#default_grid" do
      it "sets the grid with three rows by default" do
        board = Board.new
        expect(board.grid).to have(3).things
      end

      it "creates three things in each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row).to have(3).things
        end
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "blah")
        expect(board.grid).to eq "blah"
      end
    end

    context "#get_cell" do
      it "returns the cell based on the (x,y) coordinate" do
        grid = [["","",""],["","","something"],["","",""]]
        board = Board.new(grid: grid)
        expect(board.get_cell(2,1)).to eq "something"
      end
    end

    context "#set_cell" do
      it "updates the value of the cell object at (x,y)" do
        Cat = Struct.new(:value, :marked)
        grid = [[Cat.new("cool"),"",""], ["","",""],["","",""]]
        board = Board.new(grid: grid)
        board.set_cell(0,0,"meow")
        expect(board.get_cell(0,0).value).to eq "meow"
      end
      it "updates the marked variable of the object at (x,y) to true" do
        grid = [[Cat.new("cool"),"",""], ["","",""],["","",""]]
        board = Board.new(grid: grid)
        board.set_cell(0,0,"meow")
        expect(board.get_cell(0,0).marked).to be true
      end
      it "doesnt update the cell object at (x,y) if it has already been marked" do
        grid = [[Cat.new("cool", true),"",""], ["","",""],["","",""]]
        board = Board.new(grid: grid)
        board.set_cell(0,0,"meow")
        expect(board.get_cell(0,0).value).to eq "cool"
      end
    end

    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new("X") }
    let(:y_cell) { TestCell.new("Y") }
    let(:empty) { TestCell.new }

    context "#game_over" do
      it "returns :winner if winner? is true" do
        board = Board.new
        board.stub(:winner?) { true }
        expect(board.game_over).to eq :winner
      end

      it "returns :draw if draw? is true" do
        board = Board.new
        board.stub(:draw?) { true }
        expect(board.game_over).to eq :draw
      end

      it "returns false if winner? and draw? is false" do
        board = Board.new
        board.stub(:winner) { false }
        board.stub(:draw) { false }
        expect(board.game_over).to be false
      end

      it "returns :winner when diagonal has objects with all same values" do
        grid = [
          [x_cell, empty, empty],
          [y_cell, x_cell, y_cell],
          [y_cell, x_cell, x_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end
      it "returns :draw when all spaces on the board are filled " do
        grid = [
          [x_cell, y_cell, x_cell],
          [y_cell, x_cell, y_cell],
          [y_cell, x_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :draw
      end
      it "returns false when there is no winner or draw" do
        grid = [
          [x_cell, empty, empty],
          [y_cell, empty, empty],
          [y_cell, empty, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to be false
      end
    end

  end
end
