require "spec_helper"
require "rails_helper"

describe Tag do
  it 'should has default columns' do
    is_expected.to have_db_column(:name).of_type(:string)
  end

  describe '#paper_trail' do
    context 'with has_paper_trail attribute' do
      let(:dummy_data) { create :tag }
      it 'will has association with the versions table and has data' do
        expect(dummy_data.versions.present?).to eq true
      end
    end
  end
end
