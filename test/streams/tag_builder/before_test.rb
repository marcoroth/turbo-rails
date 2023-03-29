require "tag_builder_test_case"

class Turbo::Streams::TagBuilder::BeforeTest < TagBuilderTestCase
  test "before with target and content as positional arguments" do
    stream = %(<turbo-stream action="before" target="messages"><template>Before</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.before("messages", "Before")
  end

  test "before with target as arg and content as kwarg" do
    stream = %(<turbo-stream action="before" target="messages"><template>Before</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.before("messages", content: "Before")
  end

  test "before with target as arg and partial kwarg" do
    stream = %(<turbo-stream action="before" target="messages"><template><p>Before</p>
</template></turbo-stream>)

    article = Article.new(body: "Before")

    assert_dom_equal stream, turbo_stream.before("messages", partial: "articles/article", locals: { article: article })
  end
end
