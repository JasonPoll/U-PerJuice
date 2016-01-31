require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  subject { Ingredient.new(name: 'Blueberry', inventory_amount: 8.0, density: 1.032, pg: 100, vg: 0, nicotine: 0.0, average_cost: 1.25)}
  
  context 'validations:' do
    %w(name inventory_amount density pg vg nicotine average_cost).each do |attr|
      it "requires .#{attr}" do 
        expect(subject).to be_valid
        subject.send("#{attr}=", nil)
        expect(subject).not_to be_valid
        expect(subject.errors).to have_key(attr.to_sym)
      end
    end

    %w(nicotine density inventory_amount average_cost).each do |attr|
      it "requires .#{attr} to be a number" do 
        expect(subject).to be_valid
        subject.send("#{attr}=", 'hi')
        expect(subject).not_to be_valid
        expect(subject.errors).to have_key(attr.to_sym)
      end

      it "requires .#{attr} to be greater than 0.0" do 
        expect(subject).to be_valid
        subject.send("#{attr}=", -1.0)
        expect(subject).not_to be_valid
        expect(subject.errors).to have_key(attr.to_sym)
      end
    end

    [:pg, :vg].each do |attr|
      context ".#{attr.to_s}" do
        it 'required to be a number' do 
          expect(subject).to be_valid
          subject.send("#{attr}=".to_sym, 'hi')
          expect(subject).not_to be_valid
          expect(subject.errors).to have_key(attr)
        end

        it 'must be greater than zero' do 
          expect(subject).to be_valid
          subject.send("#{attr}=".to_sym, -1)
          expect(subject).not_to be_valid
          expect(subject.errors).to have_key(attr)
        end

        it 'must be greater than zero' do 
          expect(subject).to be_valid
          subject.send("#{attr}=".to_sym, 101)
          expect(subject).not_to be_valid
          expect(subject.errors).to have_key(attr)
        end
      end

      context '#pg_vg_sum_equals_100' do
        it 'requires that .pg and .vg sum 100' do 
          expect(subject).to be_valid
          subject.pg = 1
          subject.vg = 1
          expect(subject).not_to be_valid
          expect(subject.errors).to have_key(:pg)
          expect(subject.errors).to have_key(:vg)

          subject.pg = 0
          subject.vg = 100
          expect(subject).to be_valid

          subject.pg = 80
          subject.vg = 21
          expect(subject).not_to be_valid
          expect(subject.errors).to have_key(:pg)
          expect(subject.errors).to have_key(:vg)        
        end  

        [:pg, :vg].each do |attr|
          it "is not fired when .#{attr} is not present" do 
            expect(subject).not_to receive(:pg_vg_sum_equals_100)
            subject.send("#{attr}=".to_sym, nil)
            subject.valid?
          end
        end

        it 'is fired only when both .pg and .vg are present' do 
          expect(subject.vg).to be_present
          expect(subject.pg).to be_present
          expect(subject).to receive(:pg_vg_sum_equals_100)
          subject.valid?
        end
      end
      
    end

    it 'requires .name to be unique (case insensitive)' do 
      expect(subject).to be_valid
      subject.save!
      ing2 = Ingredient.new(subject.attributes.merge({name: subject.name.upcase}))
      expect(ing2).not_to be_valid
      expect(ing2.errors).to have_key(:name)
    end
  end

  context 'callbacks:' do
    context 'after_initialize' do
      # ensuring that an after_initialize callback fires is...tricky.  It's not like a before_save...
      # it happens when we're initializing the object!  There's two ways that I can think of, and I've
      # implemented them both here
      context '#ensure_default_values_are_set' do
        it 'is called after_initialize' do 
          expect_any_instance_of(Ingredient).to receive(:ensure_default_values_are_set)
          Ingredient.new
        end

        it 'really is called after_initialize' do 
          ing = Ingredient.allocate # like .new, but without calling #initialize
          expect(ing).to receive(:ensure_default_values_are_set)
          ing.send(:initialize)
        end

        it 'ensures .inventory_amount, .density, .pg, .vg, .nicotine and .average_cost are not nil' do 
          ing = Ingredient.new
          [:inventory_amount, :density, :pg, :vg, :nicotine, :average_cost].each do |attr|
            expect(ing.send(attr)).not_to be_nil
          end
        end
      end
    end
  end

  context 'methods:' do
    
  end
end
