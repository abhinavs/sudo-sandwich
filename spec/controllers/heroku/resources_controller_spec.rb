require 'rails_helper'

RSpec.describe Heroku::ResourcesController do
  describe 'POST /heroku/resources' do
    it 'returns a 202' do
      post :create

      expect(response.code).to eq("202")
    end

    it 'returns the correct json response' do
      heroku_uuid = "123-ABC-456-DEF",
      expected_response = {
        id: heroku_uuid,
        config: {
          RAD_ON_ADD_ON: "tubular!"
        },
        message: "Thanks for being rad and adding the rad-on add-on."
      }

      post :create, params: { "uuid" => heroku_uuid }

      expect(parsed_response_body).to eq(expected_response)
    end

    def parsed_response_body
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
