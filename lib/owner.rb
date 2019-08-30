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
    new = self
    human_species
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
    owner = self
    Cat.new(cat_name, owner)
  end

  def buy_dog(dog_name)
    owner = self
    Dog.new(dog_name, owner)
  end

  def walk_dogs
    self.dogs.map{ |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.map{ |cat| cat.mood = "happy" }
  end

  def nervous_pets
    self.cats.map { |cat| cat.mood = "nervous" }
    self.dogs.map { |dog| dog.mood = "nervous" }
  end

  def no_owner
    self.cats.map { |cat| cat.owner = nil }
    self.dogs.map { |dog| dog.owner = nil }
  end
  
  def sell_pets
    self.nervous_pets
    self.no_owner
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  private

  attr_writer :species
  
  def human_species
    self.species = "human"
  end



end