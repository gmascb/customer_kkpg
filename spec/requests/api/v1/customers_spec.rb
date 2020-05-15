require 'swagger_helper'

describe 'api/v1/customers', type: :request do


    before(:each) {
        tag = Tag.create(
            name: "teste"
        )
    
        form = Form.create(
            name: "teste",
            tag: tag
        )

        customer = Customer.create(
            name: "teste",
            email: "email@mail.com"
            form: form
        )
    }

    path '/api/v1/customers/{id}' do
        get 'Get Customer' do
          tags 'Form'
          consumes 'application/json'
    
          parameter name: 'id', :in => :path, :type => :integer, required: true
          
          response '200', 'Customer Found' do
            schema type: :object,
                   properties: {
                       id: {type: :integer},
                       name: {type: :string},
                       email: {type: :string},
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


end
