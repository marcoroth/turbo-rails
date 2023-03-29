require "tag_builder_test_case"

class Turbo::Streams::TagBuilder::AppendTest < TagBuilderTestCase
  test "append with target and content as positional arguments" do
    stream = %(<turbo-stream action="append" target="messages"><template>Append</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.append("messages", "Append")
  end

  test "append with target as arg and content as kwarg" do
    stream = %(<turbo-stream action="append" target="messages"><template>Append</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.append("messages", content: "Append")
  end

  test "append with target as arg and partial kwarg" do
    stream = %(<turbo-stream action="append" target="messages"><template><p>Append</p>
</template></turbo-stream>)

    article = Article.new(body: "Append")

    assert_dom_equal stream, turbo_stream.append("messages", partial: "articles/article", locals: { article: article })
  end
end
