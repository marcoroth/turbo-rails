require "tag_builder_test_case"

class Turbo::Streams::TagBuilder::ReplaceTest < TagBuilderTestCase
  test "replace with target and content as positional arguments" do
    stream = %(<turbo-stream action="replace" target="messages"><template>Replace</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.replace("messages", "Replace")
  end

  test "replace with target as arg and content as kwarg" do
    stream = %(<turbo-stream action="replace" target="messages"><template>Replace</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.replace("messages", content: "Replace")
  end

  test "replace with target as arg and partial kwarg" do
    stream = %(<turbo-stream action="replace" target="messages"><template><p>Replace</p>
</template></turbo-stream>)

    article = Article.new(body: "Replace")

    assert_dom_equal stream, turbo_stream.replace("messages", partial: "articles/article", locals: { article: article })
  end
end
