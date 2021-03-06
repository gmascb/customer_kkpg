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

    @customer_to_delete = Customer.create(
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
    get 'Get Customers' do
      tags 'Customer'
      consumes 'application/json'

      parameter name: "page", :in => :query, :type => :integer

      response '200', 'Customers Found' do
        schema type: :object,
               properties: {
                   customer: {
                       type: :array,
                       items: {
                           type: :object,
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
                       }
                   },
                   type: :object,
                   properties: {
                       pages: {
                           current_page: {type: :integer},
                           next_page: {type: :integer, "x-nullable": true},
                           previous_page: {type: :integer, "x-nullable": true},
                           total_pages: {type: :integer},
                           total_count: {type: :integer}
                       }
                   },
               }

        let(:page) { 1 }

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

  path '/api/customers/{id}' do
    delete 'Delete Customer' do
      tags 'Customer'
      consumes 'application/json'

      parameter name: 'id', :in => :path, :type => :integer, required: true

      response '204', 'Customers Deleted' do

        let(:id) { Customer.last.id }

        run_test!
      end

    end
  end

end
