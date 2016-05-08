require_relative 'shrift_exception'

module Shrift
  # A String that alternates between characters and numbers. Short hand for a collection
  # of variables that hold integer values.
  #
  # Shrift map keys are uppercase.
  #
  class ShriftMap
    attr_reader :hashmap, :shrift_map_string

    def initialize(shrift_map_string)
      @shrift_map_string = shrift_map_string
      @hashmap = {}
      split(shrift_map_string)
    end

    def fetch(key)
      @hashmap[key.upcase.to_sym].to_i
    end

    def store(key, value)
      @hashmap[key.upcase.to_sym] = value.to_i
    end

    def to_hash
      @hashmap
    end

    def to_s
      @shrift_map_string
    end

    def self.to_shrift_map(hash)
      ShriftMap.new(ShriftMap.to_shrift_map_string(hash))
    end

    def self.to_shrift_map_string(hash)
      shrift_map_string = ''
      hash.each do |key, val|
        shrift_map_string << key.to_s
        shrift_map_string << val.to_s
      end
      shrift_map_string
    end

    private

    def split(shrift_map_string)
      until shrift_map_string.empty?
        shrift_group = shrift_map_string.scan(/^([a-zA-Z]+)(\d+)(.*)/).first
        begin
          store(shrift_group[0], shrift_group[1])
        rescue NoMethodError
          raise ShriftException, "Unbalanced ShriftMap: #{@shrift_map_string}"
        end
        shrift_map_string = shrift_group[2]
      end
    end
  end
end
