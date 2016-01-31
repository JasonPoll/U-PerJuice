require 'rails_helper'
require 'shared/examples_for_ingredient'

RSpec.describe Ingredient, type: :model do
  it_behaves_like "an Ingredient derivation"

  subject { Ingredient.new(name: 'Blueberry', inventory_amount: 8.0, density: 1.032, pg: 100, vg: 0, nicotine: 0.0, average_cost: 1.25)}
  
  context 'validations:' do
    
  end

  context 'callbacks:' do
    
  end

  context 'methods:' do
    
  end
end
