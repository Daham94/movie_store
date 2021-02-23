require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user=User.new(email: 'example@gmail.com').save
      expect(user).to eq(false)
    end

    it 'ensures name presence' do
      user=User.new(name: 'Name').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user=User.new(name: 'Name', email: 'example@gmail.com').save
      expect(user).to eq(true)
    end

  end
end
