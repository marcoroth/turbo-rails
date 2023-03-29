require "tag_builder_test_case"

class Turbo::Streams::TagBuilder::UpdateTest < TagBuilderTestCase
  test "update with target and content as positional arguments" do
    stream = %(<turbo-stream action="update" target="messages"><template>Update</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.update("messages", "Update")
  end

  test "update with target as arg and content as kwarg" do
    stream = %(<turbo-stream action="update" target="messages"><template>Update</template></turbo-stream>)

    assert_dom_equal stream, turbo_stream.update("messages", content: "Update")
  end

  test "update with target as arg and partial kwarg" do
    stream = %(<turbo-stream action="update" target="messages"><template><p>Update</p>
</template></turbo-stream>)

    article = Article.new(body: "Update")

    assert_dom_equal stream, turbo_stream.update("messages", partial: "articles/article", locals: { article: article })
  end
end
