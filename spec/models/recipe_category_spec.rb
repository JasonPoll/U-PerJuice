require 'rails_helper'

RSpec.describe RecipeCategory do
  subject { RecipeCategory.new(name: SecureRandom.uuid) }


  context 'validations:' do
    it 'test subject is valid to begin with' do 
      expect(subject).to be_valid
    end

    context '.name' do
      it 'is required to be present' do 
        expect(subject).to be_valid
        subject.name = nil
        expect(subject).not_to be_valid
        expect(subject.errors.keys).to include(:name)
      end

      it 'is required to be unique' do 
        subject.save!
        
        bad_rec = RecipeCategory.new(name: subject.name)
        expect(bad_rec).not_to be_valid 
        expect(bad_rec.errors.keys).to include(:name)
      end
    end
  end
end
