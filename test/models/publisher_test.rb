require 'test_helper'

class PublisherTest < ActiveSupport::TestCase
  test 'Publisher with valid data should be valid' do
    publisher = Publisher.new(name: 'Publisher Test', description: 'Lorem Ipsum')

    assert publisher.valid?, publisher.errors.full_messages
  end

  test 'Publisher with invalid data should not be valid' do
    publisher = Publisher.new(name: 'Publisher Test', description: '')

    assert_not publisher.valid?, publisher.errors.full_messages
  end
end
