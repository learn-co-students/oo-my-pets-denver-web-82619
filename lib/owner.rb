require "pry"
require_relative "./cat"
require_relative "./dog"

class Owner

  attr_reader :name, :species
  @@all = []

  def self.all
    @@all
  end

  def initialize name
    @name = name
    @species = "human"
    self.class.all << self
  end

  def say_species
    "I am a human."
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|cat| cat.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.map{ |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats.map{ |cat| cat.mood = "happy" }
  end

  def all_pets
    dogs + cats
  end
  
  def nervous_pets
    all_pets.map { |pet| pet.mood = "nervous" }
  end

  def no_owner
    all_pets.map { |pet| pet.owner = nil }
  end
  
  def sell_pets
    nervous_pets
    no_owner
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end