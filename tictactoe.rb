class Game
  attr_accessor :board
  def initialize
    @board = PlayingBoard.new
    @player1 = Player.new
    puts "Player 1 has the symbol #{@player1.symbol}"
    @player2 = Player.new
    puts "Player 2 has the symbol #{@player2.symbol}"
  end

  def play
    puts "Player 1, at what position do you want place to place an #{@player1.symbol}?"
    position = gets.chomp
    @player1.place_symbol_at(position)
    puts "Player 2, at what position do you want place to place an #{@player2.symbol}?"
    position = gets.chomp
    @player2.place_symbol_at(position)
  end
end

# Create a class for the players
class Player
  attr_reader :symbol
  @@player_count = 0

  #- Create a initialize method which includes a symbol to play with
  def initialize
    if @@player_count == 0
      @symbol = :X
    elsif @@player_count == 1
      @symbol = :O
    else
      puts "Tic Tac Toe can only be played by two players"
    end
    @@player_count += 1
  end

  #- Create a method that allows a player to place a symbol on the playing board (the place on the playing board is the argument) 
  def place_symbol_at(position)
    #	- Ask the players for input (gets.chomp)
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

new_game = Game.new
new_game.play