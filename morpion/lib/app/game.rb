class Game
  def initialize
    @players = create_players  # Crée les joueurs une seule fois
    @board = Board.new
    @current_player = 0
    @party_played = 0
    reset_victory_laps  # Initialisation des victoires des joueurs
  end

  def create_players
    puts "---------Welcome !----------"
    player1 = Player.new
    player2 = Player.new
    [player1, player2]
  end

  def reset_victory_laps
    @players.each { |player| player.victory_count = 0 }
  end

  def switch_player
    @current_player = (@current_player + 1) % 2
  end

  def play
    loop do
      puts "---------Game #{ @party_played += 1 } has started----------"
      @board = Board.new  # Réinitialise le plateau pour une nouvelle partie

      until @board.game_over?
        @board.display
        current_player = @players[@current_player]
        puts "#{current_player.name}'s turn"

        puts "Enter a position (e.g., A1, B2, etc.):"
        position = gets.chomp.upcase
        @board.mark_case(position, current_player.symbole)

        switch_player
      end

      @board.display
      display_winner
      break unless play_again?

    end
  end

  def display_winner
    winner = @board.winner?
    if winner
      winning_player = @players.find { |player| player.symbole == winner }
      winning_player.victory_count += 1
      puts "#{winning_player.name} wins! He now have #{winning_player.victory_count} victories."
    else
      puts "The game is a draw!"
    end
  end

  def play_again?
    loop do
      puts "Do you want to play again? (Y/N)"
      answer = gets.chomp.upcase
      return true if answer == "Y"  # Relance une nouvelle partie
      return false if answer == "N" # Termine le jeu
      puts "Invalid input. Please enter Y or N."
    end
  end
end


