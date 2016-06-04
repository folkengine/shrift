require 'psych'
require 'shrift'

require_relative('../test_helper')
require_relative('examples/character')

class TestShrift < Minitest::Test
  include Example

  def setup
    @shrift_mapper = ShriftMapper.new(hashmap: {
        ST: 'strength',
        DX: 'dexterity',
        CN: 'constitution',
        W: 'wisdom',
        I: 'intelligence',
        CH: 'charisma'})

    @shrift = Shrift.new(Character, [ShriftCell.new(:character_name), @shrift_mapper, ShriftInt.new(:hit_points)])

    @bub = Character.new('bub')
    @bub.strength = 15
    @bub.dexterity = 14
    @bub.constitution = 10
    @bub.wisdom = 18
    @bub.intelligence = 3
    @bub.charisma = 6
    @bub.hit_points = 4
  end

  def test_validate_clazz
    assert_equal(@shrift.clazz, Character)
  end

  def test_short
    short = @shrift.short(@bub)
    short_shrift = short
    puts short_shrift
    split = short_shrift.split(':')

    assert_equal(split[0], @bub.character_name)
    assert_equal(split[2], @bub.hit_points.to_s)
  end

  def test_classify
    short = @shrift.short(@bub)
    bub = @shrift.classify(short)
    assert_equal(@bub, bub)
  end
end
