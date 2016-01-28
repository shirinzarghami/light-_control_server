
require 'test_helper'

class LightsControllerTest < ActionController::TestCase
  setup do
    @light = lights(:one)
  end

  test 'turn on' do
    post :turn_on, id: @light.id, format: :json
  end
end
