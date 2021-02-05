class Game

  def initialize(player1 = Player.new, player2 = Player.new)
    $board = "1 2 3\n4 5 6\n7 8 9"
    @player1 = player1
    @player2 = player2
  end

  def play
    puts "Player 1 has the symbol #{@player1.symbol} and may start."
    puts "Player 2 has the symbol #{@player2.symbol}."
    puts $board
    take_turns
  end

  def take_turns

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