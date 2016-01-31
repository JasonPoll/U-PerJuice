RSpec.shared_examples "a Note derivation" do
  subject { described_class.new(text: "#{described_class.name} test note.") }

  context 'STI' do
    if described_class != Note
      it 'is an STI model' do 
        expect(described_class.descends_from_active_record?).to eq(false)
      end  
    end

    it 'populates type column correctly' do 
      subject.save!
      expect(subject.type).to eq(described_class.name)
    end
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