require 'test_helper'

class Api::V1::PicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @picture = pictures(:one)
    @publisher = publishers(:one)
  end

  test 'Should create picture' do
    assert_difference('Picture.count') do
      post api_v1_pictures_url,
           params: {
             picture: {
               description: 'Lorem Ipsum',
               url: 'www.google.com',
               category: 'profile-picture',
               publisher_id: @publisher.id
             }
           }, as: :json
    end

    assert_response :created
  end

  test 'Should not create picture' do
    assert_no_difference('Picture.count') do
      post api_v1_pictures_url,
           params: {
             picture: {
               description: 'Lorem Ipsum',
               url: 'www.google.com',
               category: '',
               publisher_id: 123_222_222
             }
           }, as: :json
    end

    assert_response :unprocessable_entity
  end

  test 'Should show picture' do
    get api_v1_picture_url(@picture), as: :json

    assert_response :ok, @picture.errors.full_messages
  end

  test 'Should not show picture' do
    get api_v1_picture_url(23_133), as: :json

    assert_response :not_found, @picture.errors.full_messages
  end

  test 'Should list pictures' do
    get api_v1_pictures_url, as: :json

    assert_response :ok, @picture.errors.full_messages
  end

  test 'Should destroy picture' do
    assert_difference('Picture.count', -1) do
      delete api_v1_picture_url(@picture),
             as: :json
    end
    assert_response :no_content, @picture.errors.full_messages
  end

  test 'Should update picture' do
    patch api_v1_picture_url(@picture),
          params: {
            picture: {
              description: 'New qqw'
            }
          }, as: :json

    assert_response :ok, @picture.errors.full_messages
  end

  test 'Should not update picture' do
    patch api_v1_picture_url(@picture),
          params: {
            picture: {
              description: ''
            }
          }, as: :json

    assert_response :unprocessable_entity
  end
end
