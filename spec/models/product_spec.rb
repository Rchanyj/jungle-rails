require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'a product with all four fields will save successfully' do
      @category = Category.new
      @product = Product.new(name: "Testbobby", price: 40.00, quantity: 2, category: @category)
      expect(@product.save).to be true
    end

    it 'does not save without a name' do
      @category = Category.new
      @product = Product.new(name: nil, price: 40.00, quantity: 2, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'does not save without a price' do
      @category = Category.new
      @product = Product.new(name: "Bobby", price: nil, quantity: 2, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'does not save without a quantity' do
      @category = Category.new
      @product = Product.new(name: "Bobby", price: 50.00, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'does not save without a category' do
      @category = Category.new
      @product = Product.new(name: "Bobby", price: 50.00, quantity: 2, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
