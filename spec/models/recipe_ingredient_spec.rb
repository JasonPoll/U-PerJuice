require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  subject { RecipeIngredient.new(percentage: rand*100.0) }

  context 'validations:' do
    context '.percentage' do
      it "is required" do 
        expect(subject).to be_valid
        subject.percentage = nil
        expect(subject).not_to be_valid
        expect(subject.errors).to have_key(:percentage)
      end
        
    
      it "required to be a number" do 
        expect(subject).to be_valid
        subject.percentage = 'hi'
        expect(subject).not_to be_valid
        expect(subject.errors).to have_key(:percentage)
      end

      it "required to be greater than 0.0" do 
        expect(subject).to be_valid
        subject.percentage = -1.0
        expect(subject).not_to be_valid
        expect(subject.errors).to have_key(:percentage)
      end

      it "require to be less than 100.0" do 
        expect(subject).to be_valid
        subject.percentage = 101.0
        expect(subject).not_to be_valid
        expect(subject.errors).to have_key(:percentage)
      end
    end
  end

  context 'callbacks:' do
    context 'after_initialize' do
      # ensuring that an after_initialize callback fires is...tricky.  It's not like a before_save...
      # it happens when we're initializing the object!  There's two ways that I can think of, and I've
      # implemented them both here
      context '#ensure_default_values_are_set' do
        it 'is called after_initialize' do 
          expect_any_instance_of(described_class).to receive(:ensure_default_values_are_set)
          described_class.new
        end

        it 'really is called after_initialize' do 
          obj = described_class.allocate # like .new, but without calling #initialize
          expect(obj).to receive(:ensure_default_values_are_set)
          obj.send(:initialize)
        end

        it 'ensures .percentage not nil' do 
          obj = described_class.new
          expect(obj.percentage).not_to be_nil
        end
      end
    end

    context 'before_save' do
      context '#truncate_percentage' do
        it 'is called when .percentage has changed in value' do 
          expect(subject).to receive(:truncate_percentage)
          subject.save 
        end

        it 'is not called when .percentage has not changed in value' do 
          ri = RecipeIngredient.new
          expect(ri).not_to receive(:truncate_percentage)
          ri.save 
        end

        it 'truncates .percentage to 2 decimal places' do 
          expect(decimals(subject.percentage)).to be > 2
          subject.save!
          expect(decimals(subject.percentage)).to eq(2)
        end
      end

      def decimals(float_val)
        float_val.to_s.split('.')[1].length
      end
    end
  end



end
