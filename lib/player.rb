class Player
  attr_accessor :name, :life_points

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(points_lost)
    @life_points = @life_points - points_lost
    if @life_points <= 0 
      puts "le joueur #{name} a été tué !"
    end
  end

  def attacks(player_number)
    puts "Le joueur #{name} attaque le joueur #{player_number.name}"
    damage_done = compute_damage
    puts "il lui inflige #{damage_done} points de dommages"
    player_number.gets_damage(damage_done)
  end

  def compute_damage
    return rand(1..6)
  end
end


# Version 2.0 : on crée un type de joueur humain

class HumanPlayer < Player
  attr_accessor :weapon_level

def initialize(name_to_save)
  @name = name_to_save
  @life_points = 100
  @weapon_level = 1
end

def show_state
  puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
end

def compute_damage
  rand(1..6) * @weapon_level
end

def search_weapon
  new_weapon_level = rand(1..6)
  puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
  if new_weapon_level > @weapon_level
    puts "Oh yeah cette arme est d'un meilleur niveau que ton arme actuelle : tu la prends"
    @weapon_level = new_weapon_level
  else puts "fuck cette arme n'est pas mieux que celle que tu as actuellement"
  end
end

def search_health_pack
  health_level = rand(1..6)
  case health_level
  when 1
    puts "Tu n'as rien trouvé ..."
  when 6
    @life_points += 80
    if @life_points > 100
      @life_points = 100
    end
    puts "Waow, tu as trouvé un pack de +80 points de vie !"
  else
    @life_points += 50
    if @life_points > 100
      @life_points = 100
    end
    puts "Bravo, tu as trouvé un pack de +50 points de vie !"
  end
end

end