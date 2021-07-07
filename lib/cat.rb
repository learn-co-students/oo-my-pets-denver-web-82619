require_relative './owner.rb'

class Cat
  attr_reader :name
  attr_accessor :owner, :mood
  @@all = []

  def self.all
    @@all
  end

    def initialize (name, owner)
      @name = name
      @owner = owner
      @mood = "nervous"
      self.class.all << self
    end



end