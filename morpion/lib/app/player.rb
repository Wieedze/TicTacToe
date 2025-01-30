class Player
  attr_accessor :name, :symbole, :victory_count

  @@taken_symbols = []  # Stocke les symboles déjà pris

  def initialize
    get_name
    get_symbole
    @victory_count = 0  # Compteur de victoires
  end

  def get_name
    puts "Write your name!"
    print "> "
    @name = gets.chomp
    puts "Welcome #{@name}!"
  end

  def get_symbole
    loop do
      puts "#{@name}, choose your symbol: 'X' or 'O'"
      print "> "
      chosen_symbole = gets.chomp.upcase

      if ['X', 'O'].include?(chosen_symbole) && !@@taken_symbols.include?(chosen_symbole)
        @symbole = chosen_symbole
        @@taken_symbols << chosen_symbole
        break
      else
        puts "Invalid choice. Please choose the remaining symbol: #{(['X', 'O'] - @@taken_symbols).join(' or ')}"
      end
    end
  end
end