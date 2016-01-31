require 'rails_helper'
require 'shared/examples_for_note'

RSpec.describe RecipeNote, type: :model do
  it_behaves_like 'a Note derivation' # pulls in the shared specs from shared_examples_for_note.rb


  subject { RecipeNote.new(text: 'a recipe note') }

  context 'associations:' do
    
  end

  context 'scopes' do
    before(:each) do
      Note.create!(text: 'a Note note')
    end

    context "#recipe_notes" do
      it "returns only #{described_class} records" do 
        derived_note = RecipeNote.create!(text: "a #{described_class.name} note")
        derived_notes = RecipeNote.recipe_notes
        expect(derived_notes.any?{|n| n.type != "#{described_class.name}"}).to eq(false)
      end
    end
  end

  context 'validations:' do

  end

end
