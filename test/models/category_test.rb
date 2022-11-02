require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @publisher = publishers(:one)
  end

  test 'Category with valid data should be valid' do
    category = Category.new(name: 'Youtubers', description: 'Lorem Ipsum')

    assert category.valid?, category.errors.full_messages
  end

  test 'Category with invalid data should not be valid' do
    category = Category.new(name: '', description: 'Lorem Ipsum')

    assert_not category.valid?, category.errors.full_messages
  end
end
