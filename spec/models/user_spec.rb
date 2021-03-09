require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    user = User.new(first_name: "First", last_name: "Last", email: "some@email.com", password: "password", password_confirmation: "password")

      it 'is valid with valid attributes' do
        expect(user).to be_valid
      end

      it 'is not valid without a first name' do
        user.first_name = nil
        expect(user).to_not be_valid
      end

      it 'is not valid without a last name' do
        user.last_name = nil
        expect(user).to_not be_valid
      end

      it 'is not valid without an email' do
        user.email = nil
        expect(user).to_not be_valid
      end

      it 'is not valid without a password' do
        user.password = nil
        expect(user).to_not be_valid
      end
  end

  describe '.authenticate_with_credentials' do
    user = User.create(first_name: "First", last_name: "Last", email: "thisemail@hasnotbeentaken.com", password: "password", password_confirmation: "password")

    it 'should return nil if password is wrong' do
    expect(user.authenticate_with_credentials("thisemail@hasnotbeentaken.com", "wrongpassword")).to eq(nil)
    end

    it 'should return user even if the entered email has whitespace' do
      expect(user.authenticate_with_credentials("  thisemail@hasnotbeentaken.com   ", user.password)).not_to eq(nil)
    end

    it 'should return user even if the entered email was oDDly CAseD' do
      expect(user.authenticate_with_credentials("  THISemail@hasNOTbeentaken.cOM   ", user.password)).not_to eq(nil)
    end

  end

end