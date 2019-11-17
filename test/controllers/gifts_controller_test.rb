# frozen_string_literal: true

require 'test_helper'

class GiftsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    Gift.create([
                  { name: 'table' },
                  { name: 'chair' }
                ])
    get '/gifts'
    request_gifts = JSON.parse(response.boy)
    assert_response :success
    assert_equal(
      gifts.to_json,
      request_gifts['gifts'].map { |el| el['name'] }.to_json
    )
  end

  test 'should get create' do
    get gifts_create_url
    assert_response :success
  end
end
