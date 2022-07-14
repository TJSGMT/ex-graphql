module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    # description: "An example field added by the generator"
    # field :articles, [Types::ArticleType], null: false

    field :article, ArticleType, null: true do
      argument :id, ID, required: true
    end

    # def test_field
    #   "Hello World!"
    # end

    # def articles
    #   Article.all
    # end

    # def article
    #   Article.find(id: params[:id])
    # end

    # def resolve(id:)
    #   article = Article.find(id)
    #   { article: article }
    # end

    def article(id:)
      Article.find(id)
    end
  end
end
