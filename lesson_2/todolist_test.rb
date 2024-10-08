require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size 
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add('string') }
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_add_alias
    new_item = Todo.new('Test')
    @list << new_item
    assert_equal(new_item, @list.last)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(3) }
  end

  def test_mark_done_at
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done)
    assert_equal(true, @todo2.done)
    assert_equal(false, @todo3.done)
    assert_raises(IndexError) { @list.mark_done_at(3) }
  end

  def test_mark_undone_at
    @todos.each(&:done!)
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done)
    assert_equal(false, @todo2.done)
    assert_equal(true, @todo3.done)
    assert_raises(IndexError) { @list.mark_undone_at(3) }
  end

  def test_done_mutating
    assert_equal(false, @todos.all?(&:done))
    @list.done!
    assert_equal(true, @todos.all?(&:done))
  end

  def test_remove_at
    assert_equal(@todo1, @list.remove_at(0))
    assert_equal([@todo2, @todo3], @list.to_a)
    assert_raises(IndexError) { @list.remove_at(3) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    --- Today's Todos ---
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_item_done
    output = <<~OUTPUT.chomp
    --- Today's Todos ---
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_items_done
    output = <<~OUTPUT.chomp
    --- Today's Todos ---
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each_iterates
    result = []
    @list.each { |todo| result << todo }
    assert_equal(@todos, result)
  end

  def test_each_return_self
    assert_equal(@list, @list.each{ |todo| nil })
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select { |todo| todo.done? }.to_s)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title('milk'))
    assert_equal(@todo2, @list.find_by_title('Clean'))
    assert_equal(@todo3, @list.find_by_title('gym'))
  end

  def test_all_done
    assert_equal([], @list.all_done.to_a)
    list_clone = @list.clone

    list_clone.mark_done_at(0)
    @list.mark_done_at(0)
    assert_equal(list_clone.all_done.to_a, @list.all_done.to_a)
  end

  def test_all_not_done
    assert_equal(@list.to_a, @list.all_not_done.to_a)
  end

  def test_mark_done
    assert_equal(false, @todo1.done)
    assert_equal(false, @todo2.done)
    assert_equal(false, @todo3.done)

    @list.mark_done('milk')
    @list.mark_done('Clean')
    @list.mark_done('gym')

    assert_equal(true, @todo1.done)
    assert_equal(true, @todo2.done)
    assert_equal(true, @todo3.done)
  end

  def test_mark_all_done
    assert_equal(false, @todos.any?(&:done?))
    @list.mark_all_done
    assert_equal(true, @todos.all?(&:done?))
  end

  def mark_all_undone
    assert_equal(true, @todos.all?(&:done?))
    @list.mark_all_done
    assert_equal(false, @todos.any?(&:done?))
  end
end