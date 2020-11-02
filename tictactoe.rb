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
    loop do
      @player1.place_symbol
      if @player1.has_won?
        puts "Player 1, you have won!"
        break
      elsif @player1.has_tied?
        puts "You have tied!"
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
    while $board.include?(position.to_s) == false || position == ""
      puts "You have not indicated an available position. Please try again."
      position = gets.chomp
    end
    #	- Substitute one space on the board with the symbol
    $board = $board.sub(position.to_s, self.symbol.to_s)
    puts $board
    #	- Create a new method that, after placing each symbol, checks whether the current player has three symbols in a row, by using the index numbers of the string $board
  end

  def has_won?
    if ($board[8] == self.symbol.to_s) && ($board[0] == self.symbol.to_s) && ($board[16] == self.symbol.to_s)
      return true
    elsif ($board[8] == self.symbol.to_s) && ($board[4] == self.symbol.to_s) && ($board[12] == self.symbol.to_s)
      return true
    elsif ($board[8] == self.symbol.to_s) && ($board[6] == self.symbol.to_s) && ($board[10] == self.symbol.to_s)
      return true
    elsif ($board[8] == self.symbol.to_s) && ($board[2] == self.symbol.to_s) && ($board[14] == self.symbol.to_s)
      return true
    elsif ($board[0] == self.symbol.to_s) && ($board[2] == self.symbol.to_s) && ($board[4] == self.symbol.to_s)
      return true
    elsif ($board[0] == self.symbol.to_s) && ($board[6] == self.symbol.to_s) && ($board[12] == self.symbol.to_s)
      return true
    elsif ($board[16] == self.symbol.to_s) && ($board[4] == self.symbol.to_s) && ($board[10] == self.symbol.to_s)
      return true
    elsif ($board[16] == self.symbol.to_s) && ($board[12] == self.symbol.to_s) && ($board[14] == self.symbol.to_s)
      return true
    else
      return false
    end
  end

  def has_tied?
    if $board.count(self.symbol.to_s) == 5
      return true
    end
  end
end

new_game = Game.new
new_game.play