require "test_helper"

class TodoTest < ActiveSupport::TestCase

  def setup
    @todo = Todo.new(body: "todo test", isDone: false)
  end

  test "should be valid" do
    assert @todo.valid?
  end
end
