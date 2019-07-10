require 'test_helper'

module Api
  class FeedbacksControllerTest < ActionDispatch::IntegrationTest
    def test_create_success
      post api_feedbacks_path, params: {
        name: 'test',
        comment: 'test'
      }
      body = JSON.parse(response.body)
      assert_equal body['message'], 'Successfully submitted your feedback'
    end

    def test_create__failure
      post api_feedbacks_path, params: {
        name: 'test',
        comment: ''
      }
      body = JSON.parse(response.body)
      assert_equal body['error'], 'Something went wrong, try again'
    end
  end
end
