require_relative 'shrift_map'

module Shrift
  class ShriftMapper
    attr_accessor :map

    def initialize(map: {}, strict: false)
      @map = map
      @strict = strict
      clean
    end

    def fetch(key)
      @map[key]
    end

    def store(key, value)
      @map[key] = value
    end

    def parse(shrift_map_string)
      hash = {}
      ShriftMap.new(shrift_map_string).map.each do |key, val|
        hash[@map[key]] = val
      end
      hash
    end

    def to_hash
      @map
    end

    private

    def clean
      @map = Hash[@map.map { |k, v| [k.to_sym, v] }]
    end
  end
end
