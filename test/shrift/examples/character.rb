module Example
  class Character
    attr_reader :character_name, :strength, :dexterity, :constitution, :wisdom, :intelligence, :charisma

    def initialize(character_name)
      @character_name = character_name
      @strength = 10
      @dexterity = 10
      @constitution = 10
      @wisdom = 10
      @intelligence = 10
      @charisma = 10
    end
  end
end