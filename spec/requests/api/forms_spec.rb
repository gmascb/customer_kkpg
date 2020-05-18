# rake rswag:specs:swaggerize

require 'swagger_helper'

describe 'api/forms', type: :request do

  before(:each) {
    @tag = Tag.create(
        name: "test"
    )

    @form = Form.create(
        name: "test",
        tag: @tag
    )

    @form_to_delete = Form.create(
        name: "test",
        tag: @tag
    )
  }

  path '/api/forms/{id}' do
    get 'Get Form' do
      tags 'Form'
      consumes 'application/json'

      parameter name: 'id', :in => :path, :type => :integer, required: true

      response '200', 'Form Found' do
        schema type: :object,
               properties: {
                   id: {type: :integer},
                   name: {type: :string},
                   type: :object,
                   tag: {
                       id: {type: :integer},
                       name: {type: :string}
                   },
                   created_at: {type: :string},
                   updated_at: {type: :string}
               }

        let(:id) { @form.id }

        run_test!
      end

    end
  end

  path '/api/forms' do
    get 'Get Forms' do
      tags 'Form'
      consumes 'application/json'

      response '200', 'Forms Found' do
        schema type: :object,
               form: {
                   type: :array,
                   items: {
                       id: {type: :integer},
                       name: {type: :string},
                       type: :object,
                       tag: {
                           id: {type: :integer},
                           name: {type: :string}
                       },
                       created_at: {type: :string},
                       updated_at: {type: :string}
                   }
               }

        run_test!
      end

    end
  end

  path '/api/forms' do
    post 'Create Form' do
      tags 'Form'
      consumes 'application/json'

      parameter name: :form, in: :body, schema: {
          type: :object,
          properties: {
              name: {type: :string},
              tag_id: {type: :integer}
          }
      }

      response '201', 'Form Created' do
        schema type: :object,
               properties: {
                   id: {type: :integer},
                   name: {type: :string},
                   type: :object,
                   tag: {
                       id: {type: :integer},
                       name: {type: :string}
                   },
                   created_at: {type: :string},
                   updated_at: {type: :string}
               }

        let(:form) {
          {
              "name": "name",
              "tag_id": @tag.id
          }
        }

        run_test!
      end

    end
  end

  path '/api/forms/{id}' do
    delete 'Delete Form' do
      tags 'Form'
      consumes 'application/json'

      parameter name: 'id', :in => :path, :type => :integer, required: true

      response '204', 'Form Deleted' do

        let(:id) { @form_to_delete.id }

        run_test!
      end

    end
  end

end

