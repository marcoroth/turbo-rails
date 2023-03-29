require "tag_builder_test_case"

class Turbo::Streams::TagBuilder::RemoveTest < TagBuilderTestCase
  test "remove with target as positional argument" do
    stream = %(<turbo-stream action="remove" target="messages"></turbo-stream>)

    assert_dom_equal stream, turbo_stream.remove("messages")
  end
end
