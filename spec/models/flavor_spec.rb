require 'rails_helper'
require 'shared/examples_for_ingredient'

RSpec.describe Flavor, type: :model do
  it_behaves_like 'an Ingredient derivation' # pulls in the shared specs from shared_examples_for_note.rb

  context 'validations:' do

  end

  context 'associations:' do
    
  end

  context 'scopes' do
    let(:attributes) { { name:             "Blueberry(#{described_class.name}-#{SecureRandom.uuid})", 
                         inventory_amount: 8.0, 
                         density:          1.032, 
                         pg:               100, 
                         vg:               0, 
                         nicotine:         0.0, 
                         average_cost:     1.25 } }
    before(:each) do
      Ingredient.new(attributes) # make sure there's a baseclass record in the DB
    end

    context "#flavors" do
      it "returns only #{described_class} records" do 
        derived = Flavor.create!(attributes)
        derived = Flavor.flavors
        expect(derived.any?{|n| n.type != "#{described_class.name}"}).to eq(false)
      end
    end
  end

  
end
