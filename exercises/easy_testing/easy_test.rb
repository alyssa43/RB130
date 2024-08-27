require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'easy'

class EasyTesting < Minitest::Test
  def test_value_odd? #1
    value = 1
    assert_equal(true, value.odd?)
    value = 2
    assert_equal(false, value.odd?)
  end

  def test_value_downcase #2
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end

  def test_value_nil #3
    value = nil
    assert_nil(value)
    value = true
    refute_nil(value)
  end

  def test_empty_list #4
    list = []
    assert_empty(list)
    list = [1, 2, 3]
    refute_empty(list)
  end

  def test_includes #5
    list = ['a', 'b', 'xyz']
    assert_includes(list, 'xyz')
    list = []
    refute_includes(list, 'xyz')
  end

  def test_raise_employee_hire #6
    employee = Test.new
    assert_raises(NoExperienceError) do
      employee.hire
    end
  end

  def test_value_numeric #7
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end

  def test_value_numeric_subclass #8
    values =[Numeric.new, 1, 1.5]
    values.each { |value| assert_kind_of(Numeric, value) }
  end

  def test_list_process #9
    list = Test.new
    assert_same(list, list.process)
  end

  def test_doesnt_include #10
    list = ['a', 'b', 'c']
    refute_includes(list, 'xyz')
    list = ['a', 'b', 'xyz']
    assert_includes(list, 'xyz')
  end
end
