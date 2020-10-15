-# Create a class for the players
class Player
  @@player_count = 0

  #- Create a initialize method which includes a symbol to play with
  def initialize
    @symbol = symbol
    if @@player_count = 0
      symbol = :x
    else
      symbol = :o
    end
    @@player_count += 1
  end

end

#- Create a method that allows a player to place a symbol on the playing board (the place on the playing board is the argument) 
#	- Ask the players for input (gets.chomp)
#	- Substitute one space on the board with the symbol
#	- Create a new method that, after placing each symbol, checks whether the current player has three symbols in a row

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