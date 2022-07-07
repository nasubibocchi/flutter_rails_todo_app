require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user validation' do
    context 'when user has valid email' do
      let(:user) { create(:user,
                            name: 'MyString',
                            email: 'abcde@email.com',
                            password: 'foobar',
                            password_confirmation: 'foobar') }
      it 'should be valid' do
        expect(user.valid?).to eq true
      end
    end
  end
end
