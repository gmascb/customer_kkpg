# rake rswag:specs:swaggerize

require 'swagger_helper'

describe 'api/tags', type: :request do

  before(:each) {
    @tag = Tag.create(
        name: "test"
    )

    @tag_delete = Tag.create(
        name: "test_delete"
    )
  }

  path '/api/tags/{id}' do
    get 'Get Tag' do
      tags 'Tag'
      consumes 'application/json'

      parameter name: 'id', :in => :path, :type => :integer, required: true

      response '200', 'Tag Found' do
        schema type: :object,
               properties: {
                   id: {type: :integer},
                   name: {type: :string},
                   created_at: {type: :string},
                   updated_at: {type: :string}
               }

        let(:id) { @tag.id }

        run_test!
      end
    end
  end

  path '/api/tags' do
    get 'Get Tags' do
      tags 'Tag'
      consumes 'application/json'

      response '200', 'Tags Found' do
        schema type: :object,
               properties: {
                   tag: {
                       type: :array,
                       items: {
                           id: {type: :integer},
                           name: {type: :string}
                       }
                   }
               }

        run_test!
      end

    end
  end

  path '/api/tags' do
    post 'Create Tag' do
      tags 'Tag'
      consumes 'application/json'

      parameter name: :tag, in: :body, schema: {
          type: :object,
          properties: {
              name: {type: :string}
          }
      }

      response '201', 'Tag Created' do
        schema type: :object,
               properties: {
                   id: {type: :integer},
                   name: {type: :string}
               }

        let(:tag) {
          {
              "name": "name"
          }
        }

        run_test!
      end

    end
  end

  path '/api/tags/{id}' do
    delete 'Delete Tag' do
      tags 'Tag'
      consumes 'application/json'

      parameter name: 'id', :in => :path, :type => :integer, required: true

      response '204', 'Tag Deleted' do

        let(:id) { Tag.last.id }

        run_test!
      end

    end
  end


end
