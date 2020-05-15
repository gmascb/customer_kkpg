# rake rswag:specs:swaggerize

require 'swagger_helper'

describe 'api/tags', type: :request do

    before(:each) {
        @tag = Tag.create(
            name: "teste"
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

end
