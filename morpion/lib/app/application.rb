#Application : cette classe va nous permettre de lancer le jeu. Elle va faire une boucle infinie de parties (on joue tant que les joueurs veulent continuer) et lancer l'instanciation d'un Game.
#
class Application

  def playing
    loop do  # Démarre une boucle infinie
      puts "Do you want to play? Y or N"
      answer = gets.chomp.strip.upcase
      case answer
      when "Y"
        game = Game.new
        game.play  # Démarre le jeu après la création de l'instance
      when "N"
        puts "End of the game."
        break  # Quitte la boucle si l'utilisateur choisit de ne pas jouer
      else
        puts "Invalid input. Please enter Y or N."  # Redemande si la réponse est invalide
      end
    end
  end
end
