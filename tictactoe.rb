# Create a class for the players
class Player
  attr_reader :symbol
  @@player_count = 0

  #- Create a initialize method which includes a symbol to play with
  def initialize
    if @@player_count == 0
      @symbol = :x
    elsif @@player_count == 1
      @symbol = :o
    else
      puts "Tic Tac Toe can only be played by two players"
    end
    @@player_count += 1
  end

  #- Create a method that allows a player to place a symbol on the playing board (the place on the playing board is the argument) 
  def place_symbol_at(position)
    #	- Ask the players for input (gets.chomp)
    puts "At what position do you want place to place #{symbol}"
    position = gets.chomp
#	- Substitute one space on the board with the symbol
#	- Create a new method that, after placing each symbol, checks whether the current player has three symbols in a row
  end
end


#PlayingBoard
#- Create a class for the playing board
class PlayingBoard
  #- Create a initialize method that sets up the board
  def initialize
    board = [[1,2,3],
             [4,5,6],
             [7,8,9]]
  end
end

player1 = Player.new
p player1.symbol
player2 = Player.new
p player2.symbol