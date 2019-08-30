class Dog
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    owner.dogs << self
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
end