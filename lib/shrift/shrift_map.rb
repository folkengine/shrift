require_relative 'shrift_exception'

module Shrift
  class ShriftMap
    attr_accessor :map, :shrift_map_string

    def initialize(shrift_map_string)
      @shrift_map_string = shrift_map_string
      @map = {}
      split(shrift_map_string)
    end

    def fetch(key)
      @map[key.to_sym].to_i
    end

    def store(key, value)
      @map[key.to_sym] = value.to_i
    end

    def to_hash
      @map
    end

    def to_s
      @shrift_map_string
    end

    def self.to_shrift_map(hash)
      shrift_map_string = ""
      hash.each do |key, val|
        shrift_map_string << key.to_s
        shrift_map_string << val.to_s
      end
      ShriftMap.new(shrift_map_string)
    end

    private

    def split(shrift_map_string)
      while !shrift_map_string.empty?
        shrift_group = shrift_map_string.scan(/^([a-z]+)(\d+)(.*)/)
        begin
          store(shrift_group[0][0], shrift_group[0][1])
        rescue NoMethodError
          raise ShriftException, "Unbalanced ShriftMap: #{@shrift_map_string}"
        end
        shrift_map_string = shrift_group[0][2]
      end
    end
  end
end
