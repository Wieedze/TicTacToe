class Show 

  def initialize(board)
    @board = board  # on place le board en tant que parametre pour pouvboir lanalyser 
  end 

  def display_case(position)
    case_obj = @board.find_case(position)
    case_obj.display
  end

  def display
    # Affiche l'état du plateau sous forme de grille
    puts " #{display_case('A1')} | #{display_case('A2')} | #{display_case('A3')} "
    puts "-----------"
    puts " #{display_case('B1')} | #{display_case('B2')} | #{display_case('B3')} "
    puts "-----------"
    puts " #{display_case('C1')} | #{display_case('C2')} | #{display_case('C3')} "
  end

end 