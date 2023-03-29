require "tag_builder_test_case"

class Turbo::Streams::TagBuilder::PrependTest < TagBuilderTestCase
  test "prepend with target and content as positional arguments" do
    stream = %(<turbo-stream action="prepend" target="messages"><template>Prepend</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.prepend("messages", "Prepend")
  end

  test "prepend with target as arg and content as kwarg" do
    stream = %(<turbo-stream action="prepend" target="messages"><template>Prepend</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.prepend("messages", content: "Prepend")
  end

  test "prepend with target as arg and partial kwarg" do
    stream = %(<turbo-stream action="prepend" target="messages"><template><p>Prepend</p>
</template></turbo-stream>)

    article = Article.new(body: "Prepend")

    assert_dom_equal stream, turbo_stream.prepend("messages", partial: "articles/article", locals: { article: article })
  end
end
