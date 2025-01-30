#BoardCase : chacune des 9 instances de BoardCase correspond à l'état d'une case du plateau.

#Variables d'instance : une Boardcase est définie par sa position (A1, B2, B3, etc.) et son contenu (Soit elle est vide, soit elle a comme valeur le string "x", soit elle a comme valeur le string "o").
#
class BoardCase
  attr_accessor :position, :content

  def initialize(position)
    @position = position
    @content = ' '  # case vide par default 
  end

  def mark(symbole)
    if ['X', 'O'].include?(symbole)  # Vérifie que le symbole est valide
      @content = symbole  # Change le contenu de la case
    else
      puts "Invalid symbol. Please use 'X' or 'O'."
    end
  end

  def display
    @content
  end
end