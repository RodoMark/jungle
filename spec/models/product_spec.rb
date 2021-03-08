require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    @category = Category.create(name: 'Toys')
    product = Product.new(name: "Product", price: 100, quantity: 2, category: @category)

      it 'is valid with valid attributes' do
        expect(product).to be_valid
      end

      it 'is not valid without a name' do
        product.name = nil
        expect(product).to_not be_valid
      end

      it 'is not valid without a price' do
        expect(product).to_not be_valid
      end

      it 'is not valid without a quantity' do
        expect(product).to_not be_valid
      end

      it 'is not valid without a category' do
        product.category = nil
        expect(product).to_not be_valid
      end
  end
end
