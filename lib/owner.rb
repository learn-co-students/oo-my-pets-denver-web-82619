class Owner
  attr_reader :name, :species
  attr_accessor :cats, :dogs

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @cats = []
    @dogs = []
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def change_pet_mood(pet_array, new_mood)
    pet_array.each {|pet| pet.mood = new_mood}
  end

  def walk_dogs
    change_pet_mood(dogs, "happy")
  end

  def remove_owners(pet_array)
    pet_array.each {|pet| pet.owner = nil}
  end

  def feed_cats
    change_pet_mood(cats, "happy")
  end

  def sell_pets
    change_pet_mood(cats, "nervous")
    change_pet_mood(dogs, "nervous")

    remove_owners(cats)
    remove_owners(dogs)

    cats.clear
    dogs.clear
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end