require 'test_helper'

class ImageModelTest < ActiveSupport::TestCase
  def test_create
    assert_difference 'Image.count', 1 do
      Image.create!(url: 'http://webapps-for-beginners.rubymonstas.org/assets/images/erb_1-b7c55b20.png')
    end
  end

  def test_validation
    image = Image.new
    assert_not_predicate image, :valid?
    assert_equal ['Url can\'t be blank', 'Url needs to be a valid image URL'], image.errors.full_messages
  end

  def test_url__valid
    valid_url_list = %w[
      http://.png
      http://assets/images/erb_1-b7c55b20.png
      http://webapps-for-beginners.rubymonstas.org/assets/images/erb_1-b7c55b20.jpg
      http://webapps-for-beginners.rubymonstas.org/assets/images/erb_1-b7c55b20.gif
    ]

    valid_url_list.each do |url|
      image = Image.new(url: url)
      assert image.valid?
    end
  end

  def test_url__invalid
    image = Image.new(url: 'http://webapps-for-beginners.rubymonstas.org/assets/images/erb_1-b7c55b20')
    assert_predicate image, :invalid?
  end
end
