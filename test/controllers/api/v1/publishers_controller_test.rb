require 'test_helper'

class Api::V1::PublishersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @publisher = publishers(:one)
  end
  test 'Should create publisher' do
    assert_difference('Publisher.count') do
      post api_v1_publishers_url,
           params: {
             publisher: {
               name: 'Publisher Test',
               description: 'Lorem Ipsum'
             }
           }, as: :json
    end

    assert_response :created
  end

  test 'Should not create publisher' do
    assert_no_difference('Publisher.count') do
      post api_v1_publishers_url,
           params: {
             publisher: {
               name: 'Publisher Test',
               description: ''
             }
           }, as: :json
    end

    assert_response :unprocessable_entity
  end

  test 'Should destroy publisher' do
    assert_difference('Publisher.count', -1) do
      delete api_v1_publisher_url(@publisher),
             as: :json
    end

    assert_response :no_content, @publisher.errors.full_messages
  end

  test 'Should show publisher' do
    get api_v1_publisher_url(@publisher), as: :json

    assert_response :ok, @publisher.errors.full_messages
  end

  test 'Should not show publisher' do
    get api_v1_publisher_url(233), as: :json

    assert_response :not_found, @publisher.errors.full_messages
  end

  test 'Should index publishers' do
    get api_v1_publishers_url, as: :json

    assert_response :ok
  end

  test 'Should update publisher' do
    patch api_v1_publisher_url(@publisher),
          params: {
            publisher: {
              name: 'New name'
            }
          }, as: :json
    assert_response :ok
  end

  test 'Should not update publisher' do
    patch api_v1_publisher_url(@publisher),
          params: {
            publisher: {
              name: ''
            }
          }, as: :json
    assert_response :unprocessable_entity
  end
end
