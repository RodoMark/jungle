require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject {
      described_class.new(name: "Product",
                  price: 100,
                  quantity: 2,
                  category: Category.find_by(id: 1)
                  )
      }

      it 'is valid with valid attributes' do
        expect(subject).to be_valid
      end

      it 'is not valid without a name' do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a price' do
        expect(subject).to_not be_valid
      end

      it 'is not valid without a quantity' do
        expect(subject).to_not be_valid
      end

      it 'is not valid without a category' do
        product.category = nil
        expect(subject).to_not be_valid
      end
  end
end
