require "test_helper"

class Turbo::TagBuilderTest < ActionView::TestCase
  test "append with positional arguments" do
    stream = "<turbo-stream action=\"append\" target=\"messages\"><template>Append</template></turbo-stream>"

    assert_equal stream, turbo_stream.append("messages", "Append")
  end

  test "append with target as arg and content as kwarg" do
    stream = "<turbo-stream action=\"append\" target=\"messages\"><template>Append</template></turbo-stream>"

    assert_equal stream, turbo_stream.append("messages", content: "Append")
  end

  test "append with target and content as kwargs" do
    stream = "<turbo-stream action=\"append\" target=\"messages\"><template>Append</template></turbo-stream>"

    assert_equal stream, turbo_stream.append(target: "messages", content: "Append")
  end

  test "append with targets and content as kwargs" do
    stream = "<turbo-stream action=\"append\" targets=\"message\"><template>Append</template></turbo-stream>"

    assert_equal stream, turbo_stream.append(targets: "message", content: "Append")
  end

  private

  def view_context
    @view_context ||= ApplicationController.new.view_context
  end

  def turbo_stream
    @turbo_stream ||= Turbo::Streams::TagBuilder.new(view_context)
  end
end
