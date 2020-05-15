# rake rswag:specs:swaggerize
require 'swagger_helper'

describe 'API' do

  before(:each) {
    Tag.create(
        id: 1,
        name: "teste"
    )
  }

  path '/tag/{id}' do
    get 'Get Tag' do
      tags 'Tag'
      consumes 'application/json'

      parameter name: 'id', :in => :path, :type => :integer, required: true
      
      response '200', 'Colaborador Found' do
        schema type: :object,
               properties: {
                   id: {type: :integer},
                   name: {type: :string},
                   created_at: {type: :string}
               }

        let(:id) { 1 }
        
        run_test!
      end

    end
  end

end
