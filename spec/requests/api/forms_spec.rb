# rake rswag:specs:swaggerize

require 'swagger_helper'

describe 'api/forms', type: :request do

    before(:each) {
        tag = Tag.create(
            name: "teste"
        )
    
        @form = Form.create(
            name: "teste",
            tag: tag
        )
    }

    path '/api/forms/{id}' do
        get 'Get Form' do
          tags 'Form'
          consumes 'application/json'
    
          parameter name: 'id', :in => :path, :type => :integer, required: true
          
          response '200', 'Tag Found' do
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

end

