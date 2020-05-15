# rake rswag:specs:swaggerize

require 'swagger_helper'

describe 'api/customers', type: :request do


  before(:each) {
    tag = Tag.create(
        name: "teste"
    )

    @form = Form.create(
        name: "teste",
        tag: tag
    )

    @customer = Customer.create(
        name: "teste",
        email: "email@mail.com",
        form: @form
    )
  }

  path '/api/customers/{id}' do
    get 'Get Customer' do
      tags 'Customer'
      consumes 'application/json'

      parameter name: 'id', :in => :path, :type => :integer, required: true

      response '200', 'Customer Found' do
        schema type: :object,
               properties: {
                   id: {type: :integer},
                   name: {type: :string},
                   email: {type: :string},
                   type: :object,
                   form: {
                       id: {type: :integer},
                       name: {type: :string}
                   },
                   created_at: {type: :string}
               }

        let(:id) { @customer.id }

        run_test!
      end

    end
  end


  path '/api/customers' do
    post 'Create Customer' do
      tags 'Customer'
      consumes 'application/json'

      parameter name: :customer, in: :body, schema: {
          type: :object,
          properties: {
              name: {
                  type: :string,
                  example: "Kent Beck"
              },
              email: {
                  type: :string,
                  example: "kentbeck@gmail.com"
              },
              form_id: {
                  type: :integer,
                  example: 1
              }
          },
          required: ["name", "email"]
      }

      response '201', 'Customer Created' do
        schema type: :object,
               properties: {
                   id: {type: :integer},
                   name: {type: :string},
                   email: {type: :string},
                   type: :object,
                   form: {
                       id: {type: :integer},
                       name: {type: :string}
                   },
                   created_at: {type: :string}
               },
               required: ["name", "email"]

        let(:customer) {
          {
              "name": "Kent Beck",
              "email": "kentbeck@hotmail.com",
              "form_id": @form.id
          }
        }

        run_test!
      end

    end
  end
end
