require "tag_builder_test_case"

class Turbo::TagBuilderTest < TagBuilderTestCase
  test "action with name and target as args and content as kwarg" do
    stream = %(<turbo-stream action="custom_action" target="custom_target"><template>Custom Content</template></turbo-stream>)

    assert_equal stream, turbo_stream.action("custom_action", "custom_target", content: "Custom Content")
  end

  test "action with additional attributes" do
    stream = %(<turbo-stream class="stream" data-controller="example" action="custom_action" target="custom_target"><template>Custom Content</template></turbo-stream>)

    assert_equal stream, turbo_stream.action("custom_action", "custom_target", content: "Custom Content", attributes: { class: "stream", data: { controller: "example" } })
  end

  test "action_all with name and targets as args and content as kwarg" do
    stream = %(<turbo-stream action="custom_action" targets="custom_targets"><template>Custom Content</template></turbo-stream>)

    assert_equal stream, turbo_stream.action_all("custom_action", "custom_targets", content: "Custom Content")
  end

  test "action_all with additional attributes" do
    stream = %(<turbo-stream class="stream" data-controller="example" action="custom_action" targets="custom_targets"><template>Custom Content</template></turbo-stream>)

    assert_equal stream, turbo_stream.action_all("custom_action", "custom_targets", content: "Custom Content", attributes: { class: "stream", data: { controller: "example" } })
  end
end
