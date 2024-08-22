class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |item| item.done? }
  end

  def add(item)
    raise TypeError.new("Can only add Todo objects") if invalid_item?(item)

    @todos << item
  end
  alias_method :<<, :add

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    each { |todo| todo.done! }
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    text = "--- #{title} ---\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos.clone
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    selected = TodoList.new(title)

    each do |todo|
      status = yield(todo)
      selected << todo if status
    end

    selected
  end

  def find_by_title(title_str)
    select { |todo| todo.title.include?(title_str) }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title_str)
    index = @todos.index(find_by_title(title_str))
    mark_done_at(index)
  end

  def mark_all_done
    done!
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  private

  def invalid_item?(item)
    item.class != Todo
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list << (todo3)

todo1.done!

p list.all_done
puts ""
p list.all_not_done