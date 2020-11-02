class Game
  attr_accessor :board

  $win = false
  def initialize
    $board = "1 2 3\n4 5 6\n7 8 9"
    @player1 = Player.new
    puts "Player 1 has the symbol #{@player1.symbol}"
    @player2 = Player.new
    puts "Player 2 has the symbol #{@player2.symbol}"
  end

  def play
    puts $board
    while $win == false
      @player1.place_symbol
      if @player1.has_won?
        puts "Player 1, you have won!"
        break
      end
      @player2.place_symbol
      if @player2.has_won?
        puts "Player 2, you have won!"
        break
      end
    end
  end
end

# Create a class for the players
class Player
  attr_reader :symbol, :name
  @@player_count = 0

  #- Create a initialize method which includes a symbol to play with
  def initialize
    if @@player_count == 0
      @name = "Player 1"
      @symbol = :X
    elsif @@player_count == 1
      @name = "Player 2"
      @symbol = :O
    else
      puts "Tic Tac Toe can only be played by two players"
    end
    @@player_count += 1
  end

  #- Create a method that allows a player to place a symbol on the playing board (the place on the playing board is the argument) 
  def place_symbol
    puts "#{self.name}, at what position do you want place to place an #{self.symbol}?"
    position = gets.chomp
    #	- Substitute one space on the board with the symbol
    $board = $board.sub(position.to_s, self.symbol.to_s)
    puts $board
    #	- Create a new method that, after placing each symbol, checks whether the current player has three symbols in a row, by using the index numbers of the string $board
  end

  def has_won?
    if $board.count(self.symbol.to_s) == 3
      puts "Checked"
      return true
    end
  end
end

new_game = Game.new
new_game.play