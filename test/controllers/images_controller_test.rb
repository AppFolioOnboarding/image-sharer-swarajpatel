require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_new
    get new_image_path

    assert_response :ok
    assert_select '.button', count: 1
    assert_select '#image_tag_list', count: 1
  end

  def test_create__success
    assert_difference 'Image.count', 1 do
      post images_path, params: {
        image: { url: 'http://webapps-for-beginners.rubymonstas.org/assets/images/erb_1-b7c55b20.png' }
      }
    end
    assert_redirected_to Image.last
  end

  def test_create__success_with_taglist_params
    tag_list_values = %w[tag1 tag2]
    assert_difference 'Image.count', 1 do
      post images_path, params: {
        image: { url: 'http://webapps-for-beginners.rubymonstas.org/assets/images/erb_1-b7c55b20.png',
                 tag_list: tag_list_values.join(', ') }
      }
    end

    assert_equal Image.last.tag_list, tag_list_values
    assert_redirected_to Image.last
  end

  def test_create__failure
    assert_no_difference 'Image.count' do
      post images_path, params: { image: { url: 'invalid url' } }
    end

    assert_response :ok
    assert_includes response.body, 'needs to be a valid image URL'
  end

  def test_show
    image = Image.create(url: 'http://valid-image.com/1.png')
    get image_path(image)
    assert_response :ok
    assert_select 'img[src="http://valid-image.com/1.png"]', count: 1
  end

  def test_index
    image1 = Image.create!(url: 'http://some-image.com/1.jpg')
    image2 = Image.create!(url: 'http://some-image.com/2.jpg')
    get images_path
    assert_response :ok
    assert_select 'img' do |elements|
      assert_equal elements[0][:src], image2.url
      assert_equal elements[1][:src], image1.url
    end
  end

  def test_root
    get root_path
    assert_response :ok
    assert_select 'h1', 'Image list'
  end
end
