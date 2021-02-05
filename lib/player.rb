class Player
  attr_reader :symbol, :name
  @@player_count = 0

  def initialize
    if @@player_count == 0
      @name = "Player 1"
      @symbol = :X
    else
      @name = "Player 2"
      @symbol = :O
    end
    @@player_count += 1
  end

  def place_symbol
    puts "#{self.name}, at what position do you want place to place an #{self.symbol}?"
    position = gets.chomp.to_i
    position = check_position(position)

    $board = $board.sub(position.to_s, self.symbol.to_s)
    puts $board
  end

  def check_position(position)
    until $board.include?(position.to_s)
      puts "You have not indicated an available position. Please try again."
      position = gets.chomp.to_i
    end

    position
  end

  def has_won?
    if ($board[0] == $board[2]) && ($board[0] == $board[4])
      return true
    elsif ($board[0] == $board[6]) && ($board[0] == $board[12])
      return true
    elsif ($board[8] == $board[0]) && ($board[8] == $board[16])
      return true
    elsif ($board[8] == $board[2]) && ($board[8] == $board[14])
      return true
    elsif ($board[8] == $board[4]) && ($board[8] == $board[12])
      return true
    elsif ($board[8] == $board[6]) && ($board[8] == $board[10])
      return true
    elsif ($board[16] == $board[4]) && ($board[16] == $board[10])
      return true
    elsif ($board[16] == $board[12]) && ($board[16] == $board[14])
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