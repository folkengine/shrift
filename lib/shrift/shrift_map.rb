module Shrift
  class ShriftMap
    attr_accessor :map

    def initialize(map = {})
      @map = map
    end

    def fetch(key)
      map[key]
    end

    def store(key, value)
      map[key] = value
    end

    def parse(shrift_map_string)

    end
  end
end
