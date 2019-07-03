require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_new
    get new_image_path

    assert_response :ok
    assert_select '.btn', count: 1
  end

  def test_create__success
    assert_difference 'Image.count', 1 do
      post images_path, params: {
        image: { url: 'http://webapps-for-beginners.rubymonstas.org/assets/images/erb_1-b7c55b20.png' }
      }
    end
  end

  def test_create__failure
    assert_no_difference 'Image.count' do
      post images_path, params: { image: { url: 'invalid url' } }
    end

    assert_response :ok
    assert_includes response.body, 'needs to be a valid image URL'
  end
end
