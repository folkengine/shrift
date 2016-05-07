module Shrift
  class ShriftMapper
    attr_accessor :map

    def initialize(map = {}, strict: false)
      @map = map
      @strict = strict
    end

    def fetch(key)
      @map[key]
    end

    def store(key, value)
      @map[key] = value
    end

    def parse(shrift_map_string)

    end

    def to_hash
      @map
    end
  end
end
