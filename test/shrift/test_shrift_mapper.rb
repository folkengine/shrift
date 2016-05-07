require 'shrift'

require_relative('../test_helper')
require_relative('examples/character')

class TestShriftMapper < Minitest::Test
  include Shrift

  def setup
    @shrift_mapper = ShriftMapper.new(map: {'st' => 'strength', 's' => 'strength', ch: 'charisma', dx: 'dexterity'})
    @shrift_map_string = 's15ch20dx19'
  end

  def test_parse
    result = @shrift_mapper.parse(@shrift_map_string)
    assert_equal 15, result['strength']
    assert_equal 20, result['charisma']
    assert_equal 19, result['dexterity']
  end
end
