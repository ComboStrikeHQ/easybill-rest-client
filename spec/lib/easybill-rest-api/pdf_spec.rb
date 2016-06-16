# frozen_string_literal: true
RSpec.describe EasybillRestClient::Pdf do
  describe '#filename' do
    context 'filename ends with ".pdf"' do
      subject { described_class.new(filename: 'something.pdf', content: double('content')) }

      it 'returns the original filename' do
        expect(subject.filename).to eq('something.pdf')
      end
    end

    context 'filename does not end with ".pdf"' do
      subject { described_class.new(filename: 'something', content: double('content')) }

      it 'appends ".pdf" to the filename' do
        expect(subject.filename).to eq('something.pdf')
      end
    end

    context 'filename ends with ".PDF"' do
      subject { described_class.new(filename: 'SOMETHING.PDF', content: double('content')) }

      it 'returns the original filename' do
        expect(subject.filename).to eq('SOMETHING.PDF')
      end
    end
  end
end
