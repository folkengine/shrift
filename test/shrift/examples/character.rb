module Example
  class Character
    attr_accessor :character_name, :strength, :dexterity,
                  :constitution, :wisdom, :intelligence, :charisma, :hit_points

    def initialize(character_name = '')
      @character_name = character_name
      @strength = 10
      @dexterity = 10
      @constitution = 10
      @wisdom = 10
      @intelligence = 10
      @charisma = 10
      @hit_points = 10
    end

    # rubocop:disable Style/CyclomaticComplexity
    def ==(other)
      character_name.eql?(other.character_name) &&
        (strength == other.strength) &&
        (dexterity == other.dexterity) &&
        (constitution == other.constitution) &&
        (wisdom == other.wisdom) &&
        (intelligence == other.intelligence) &&
        (charisma == other.charisma)
    end
    # rubocop:enable Style/CyclomaticComplexity

    def self.factory
      Character.new("Character#{rand(10_000)}")
    end
  end
end
