require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  setup do
    @publisher = publishers(:one)
  end

  test 'Picture with valid data should be valid' do
    picture = Picture.new(description: 'Lorem Ipsum', url: 'www.google.com/image.png', category: 'profile-picture',
                          publisher: @publisher)

    assert picture.valid?, picture.errors.full_messages
  end

  test 'Picture with invalid data should not be valid' do
    picture = Picture.new(description: '', url: 'www.google.com/image.png', category: 'profile-picture',
                          publisher: @publisher)

    assert_not picture.valid?, picture.errors.full_messages
  end
end
