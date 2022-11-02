require 'test_helper'

class PublisherCategoryTest < ActiveSupport::TestCase
  setup do
    @publisher = publishers(:one)
    @category = categories(:one)
  end

  test 'Publiosher Category with valid data should be valid' do
    @publisher.publisher_categories.build(category: @category)

    assert @publisher.valid?, @publisher.errors.full_messages
  end

  test 'Publiosher Category with invalid data should not be valid' do
    invalid_category = Category.new(name: '', description: '')

    @publisher.publisher_categories.build(category: invalid_category)

    assert_not @publisher.valid?, @publisher.errors.full_messages
  end
end
