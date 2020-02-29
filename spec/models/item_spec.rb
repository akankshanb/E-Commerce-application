require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validation tests' do
      it { should validate_presence_of(:cost) }
      # it { should validate_presence_of(:quantity) }

  end
  describe 'associations' do
    it { should belong_to(:user) }
  end
    
    # it 'ensures item name present' do
    #   item = Item.new(brand: 'Samsung', category: 'Electronics', quantity: 120, cost: 300.00, purchases: 50, available: true, special: false, restricted: false, age_restricted: false, image: nil, user_id: 1, popularity: 0.0, tax: 0.0).save
    #   expect(item).to include(name)
    # end
    
    
    # it 'ensures item category present' do
    #   item = Item.new(name: 'S11 Pro', brand: 'Samsung', quantity: 120, cost: 300.00, purchases: 50,       item = Item.new(brand: 'Samsung', category: 'Electronics', quantity: 120, cost: 300.00, purchases: 50, available: true, special: false, restricted: false, age_restricted: false, image: nil).save
    #   ).save
    #   expect(item).to eq(false)
    # end

    # it 'ensures item brand present' do
    #   item = Item.new(name: 'S11 Pro', category: 'Electronics', quantity: 120, cost: 300.00, purchases: 50).save
    #   expect(item).to eq(false)
    # end

    # it 'ensures item quantity present' do
    #   item = Item.new(name: 'S11 Pro', brand: 'Samsung', category: 'Electronics', cost: 300.00, purchases: 50).save
    #   expect(item).to eq(false)
    # end

    # it 'ensures item cost present' do
    #   item = Item.new(name: 'S11 Pro', brand: 'Samsung', category: 'Electronics', quantity: 120, purchases: 50).save
    #   expect(item).to eq(false)
    # end

    # it 'ensures item purchases present' do
    #   item = Item.new(name: 'S11 Pro', brand: 'Samsung', category: 'Electronics', quantity: 120, cost: 300.00).save
    #   expect(item).to eq(false)
    # end

    # it 'ensures it should save successfully' do
    #   item = Item.new(name: 'S11 Pro', brand: 'Samsung', category: 'Electronics', quantity: 120, cost: 300.00, purchases: 50).save
    #   expect(item).to eq(true)
    # end
  
  context 'scope tests' do
    
  end
end
