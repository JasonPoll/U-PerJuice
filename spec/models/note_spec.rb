require 'rails_helper'

RSpec.describe Note, type: :model do
  subject { Note.new(text: 'just a note') }

  xit 'is an STI model' do 
    # can't do this for the base class as it _does_ descend from ActiveRecord::Base
  end

  context 'associations:' do
    
  end

  context 'validations:' do
    it 'requires text to be present' do 
      expect(subject).to be_valid
      subject.text = nil
      expect(subject).not_to be_valid
      expect(subject.errors.keys).to include(:text)
    end
  end

  context 'instance methods:' do
    context 'public:' do
      context '#date' do
        it 'is a proxy to .created_at attribute' do 
          expect(subject).to receive(:created_at).at_least(:once)
          expect(subject.date).to eq(subject.created_at)
          subject.save!
          expect(subject.date).to eq(subject.created_at)
          expect(subject.created_at).not_to be_present
        end
      end
    end
  end
end
