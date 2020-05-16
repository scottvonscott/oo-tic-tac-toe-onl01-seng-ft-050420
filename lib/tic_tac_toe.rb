require 'pry'

class TicTacToe


  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
      input.to_i - 1
    end

    def move(index, token="X")
      @board[index] = token

    end

    def position_taken?(input_to_index)
      @board[input_to_index] != " "
    end

    def valid_move?(index)
      (0..8).any?(index) && @board[index] == " "
    end

    def turn

       input = input_to_index(gets.chomp)
         if valid_move?(input)
              move(input, current_player)
                display_board
         else
           input_to_index(gets.chomp)
         end
    end



    def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

    def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

    def won?
      WIN_COMBINATIONS.each do |winning_arrays|
        if @board[winning_arrays[0]] == @board[winning_arrays[1]] && @board[winning_arrays[2]] == @board[winning_arrays[1]] && position_taken?(winning_arrays[1])
            return winning_arrays
          end
        end
    false
  end


    def full?
      if @board.include?(" ")
        false
      else
        true
      end

    end

    def draw?
      if self.full?
        if self.won?
          false
        else
          true
        end
      else
        false
     end
    end

    def over?
      if self.won? || self.draw?
        true
      else
        false
      end
    end

    def winner
      # binding.pry
      turn = self.turn_count
      if self.won?
          if turn.even?
            "O"
          else
            "X"
          end
      else
          nil
      end
    end

    def play
      self.turn
      while self != self.over?
        self.turn
      end
        if self.won?
          puts "Congraulations #{winner}!"
        else
          puts "Game ended in a draw."
         end
     end

  end
