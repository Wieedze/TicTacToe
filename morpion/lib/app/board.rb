#Board : à l'initialisation du plateau, il doit instancier immédiatement 9 BoardCases (une par case).

#Variables d'instance : le Board doit embarquer les 9 BoardCase du jeu afin de pouvoir les lire et les modifier facilement. Il faut les lui attribuer sous forme d'un array ou d'un hash. Aussi, il est utile de compter le nombre de coup joué pour identifier facilement si on arrive au 9ème coup sans vainqueur.

#Méthodes : le Board va s'occuper de faire le lien entre les BoardCases et le Game : il change les valeurs des BoardCases (de " " à "x" ou "o") et vérifie en fonction de la combinaison des BoardCases si la partie est finie (= un joueur a gagné ou bien les 9 cases sont remplies sans vainqueur).
#
class Board

  attr_accessor :cases
  
  def initialize
    # Initialise une grille avec 9 cases
    @cases = [
      BoardCase.new('A1'), BoardCase.new('A2'), BoardCase.new('A3'),
      BoardCase.new('B1'), BoardCase.new('B2'), BoardCase.new('B3'),
      BoardCase.new('C1'), BoardCase.new('C2'), BoardCase.new('C3')
    ]
  end
  
  # Afficher la grille
  def display
    puts "1   2   3"
    @cases.each_slice(3) do |row|
      puts row.map(&:display).join(' | ')
      puts "---------"
    end
  end

  def mark_case(position, symbole)
    case_to_mark = @cases.find { |case_obj| case_obj.position == position }
  
    if case_to_mark && case_to_mark.display == ' '
      case_to_mark.mark(symbole)  # On passe le symbole du joueur ('X' ou 'O')
    else
      puts "Invalid move! The position is either occupied or doesn't exist."
    end
  end

  def winner?
    winning_combinations = [
      ['A1', 'A2', 'A3'],
      ['B1', 'B2', 'B3'],
      ['C1', 'C2', 'C3'],
      ['A1', 'B1', 'C1'],
      ['A2', 'B2', 'C2'],
      ['A3', 'B3', 'C3'],
      ['A1', 'B2', 'C3'],
      ['A3', 'B2', 'C1']
    ]
    winning_combinations.each do |combinaison|
      values = combinaison.map {|position|find_case(position).display}
      return values.first if values.uniq.length == 1 && values.first != ' '
      
      end
      nil
  end

  #Trouver dans le tableau @cases l'objet dont la position correspond à position
  
  def find_case(position)
    @cases.find { |case_obj| case_obj.position == position }  #Chercher et renvoyer l'objet de la case dont la position est égale à la position spécifiée.
  end

  def game_over?
    winner? || @cases.all? { |case_obj| case_obj.display != ' ' }  # Gagnant ou toutes les cases remplies
  end

end