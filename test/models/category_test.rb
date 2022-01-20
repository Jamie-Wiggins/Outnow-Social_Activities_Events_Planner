require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # failure case: should not save category with no values present
  test "should not save category with no values present" do
    category = Category.new
    refute category.valid?
    refute category.save
  end

  # success case: should save category with valid parameters
  test "should save valid category" do
    category = Category.new
    category.category = "sports"
    category.color = "#FFFFFF"
    assert category.valid?
    assert category.save
  end

  # fail case: should not save category with null category
  test "should not save category with null category" do
    category = Category.new
    category.color = "#fffff"
    refute category.valid?
    refute category.save
  end

  # fail case: should not save category with invalid category
  test "should not save category with duplicate category" do
    category = Category.new
    category.category = "sports"
    category.color = "#FFFFFF"
    assert category.valid?
    assert category.save

    category2 = Category.new
    category2.category = "sports"
    category2.color = "#FFFFFF"
    refute category2.valid?
    refute category2.save
  end

  # fail case: should not save category with invalid color
  test "should not save category with null color" do
    category = Category.new
    category.category = "sports"
    refute category.valid?
    refute category.save
  end

  # fail case: should not save category with invalid color
  test "should not save category with invalid color" do
    category = Category.new
    category.category = "sports"
    category.color = "brown"
    refute category.valid?
    refute category.save
  end
end
