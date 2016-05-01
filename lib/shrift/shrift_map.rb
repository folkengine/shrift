module Shrift
  class ShriftMap
    attr_accessor :default, :map
    attr_reader :shrift_map_string

    def initialize(shrift_map_string, default = nil)
      @default = default
      @shrift_map_string = shrift_map_string
      parse(shrift_map_string)
    end

    def fetch(key)
      map[key]
    end

    def store(key, value)
      map[key] = value
    end

    private

    def parse(shrift_map_string)

    end
  end
end
