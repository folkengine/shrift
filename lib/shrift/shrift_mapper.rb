require_relative 'shrift_map'

module Shrift
  class ShriftMapper
    attr_accessor :hashmap

    def initialize(hashmap: {}, strict: false)
      @hashmap = hashmap
      @strict = strict
      clean
    end

    def fetch(key)
      @hashmap[key.upcase.to_sym]
    end

    def store(key, value)
      @hashmap[key] = value
    end

    def parse(shrift_map_string)
      hash = {}
      ShriftMap.new(shrift_map_string).hashmap.each do |key, val|
        hash[@hashmap[key]] = val
      end
      hash
    end

    def to_hash
      @hashmap
    end

    def to_shrift_string(mappie)
      s = ''
      mappie.each do |key, val|
        s << @hashmap.key(key).to_s
        s << val.to_s
      end
      s
    end

    private

    # Convert Hash keys to symbols
    def clean
      @hashmap = Hash[@hashmap.map { |k, v| [k.upcase.to_sym, v] }]
    end
  end
end
