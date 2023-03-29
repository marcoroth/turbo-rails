require "tag_builder_test_case"

class Turbo::Streams::TagBuilder::AfterTest < TagBuilderTestCase
  test "after with target and content as positional arguments" do
    stream = %(<turbo-stream action="after" target="messages"><template>After</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.after("messages", "After")
  end

  test "after with target as arg and content as kwarg" do
    stream = %(<turbo-stream action="after" target="messages"><template>After</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.after("messages", content: "After")
  end

  test "after with target as arg and partial kwarg" do
    stream = %(<turbo-stream action="after" target="messages"><template><p>After</p>
</template></turbo-stream>)

    article = Article.new(body: "After")

    assert_dom_equal stream, turbo_stream.after("messages", partial: "articles/article", locals: { article: article })
  end
end
