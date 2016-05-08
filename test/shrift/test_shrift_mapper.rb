require 'shrift'

require_relative('../test_helper')
require_relative('examples/character')

class TestShriftMapper < Minitest::Test
  include Shrift

  def setup
    @shrift_mapper = ShriftMapper.new(hashmap: {'ST' => 'strength', CH: 'charisma', DX: 'dexterity'})
    @shrift_map_string = 'ST15CH20DX19'
  end

  def test_parse
    result = @shrift_mapper.parse(@shrift_map_string)
    assert_equal 15, result['strength']
    assert_equal 20, result['charisma']
    assert_equal 19, result['dexterity']
  end

  def test_to_shrift_string
    mappie = {'strength' => 19, 'charisma' => 15, 'dexterity' => 9}
    shrift_string = @shrift_mapper.to_shrift_string(mappie)
    shrift_map = ShriftMap.new(shrift_string)
    assert_equal mappie['strength'], shrift_map.fetch(:ST)
    assert_equal mappie['charisma'], shrift_map.fetch(:CH)
    assert_equal mappie['dexterity'], shrift_map.fetch(:DX)
  end

  def test_to_shrift_map
    mappie = {'strength' => 19, 'charisma' => 15, 'dexterity' => 9}
    shrift_map = @shrift_mapper.to_shrift_map(mappie)
    assert_equal shrift_map.fetch(:st), mappie['strength']
    assert_equal shrift_map.fetch(:ST), mappie['strength']
    assert_equal shrift_map.fetch(:CH), mappie['charisma']
    assert_equal shrift_map.fetch(:dx), mappie['dexterity']
  end
end
