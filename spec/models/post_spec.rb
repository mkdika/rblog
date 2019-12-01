require 'spec_helper'
require 'rails_helper'

describe Post do
  it 'should has default columns' do
    is_expected.to have_db_column(:permalink).of_type(:string)
    is_expected.to have_db_column(:title).of_type(:string)
    is_expected.to have_db_column(:content).of_type(:text)
    is_expected.to have_db_column(:release).of_type(:boolean)
    is_expected.to have_db_column(:release_date).of_type(:datetime)
    is_expected.to have_db_column(:category_id).of_type(:integer)
  end

  it 'should has indexes' do
    is_expected.to have_db_index [:category_id]
    is_expected.to have_db_index [:user_id]
  end

  describe '#paper_trail' do
    context 'with has_paper_trail attribute' do
      let(:dummy_data) { create :post }
      it 'will has association with the versions table and has data' do
        expect(dummy_data.versions.present?).to eq true
      end
    end
  end

  describe '#permalink' do
    context 'given valid title' do
      let(:dummy_post) { create :post, title: 'Ruby is Awesome' }
      it 'will generate valid permalink' do
        expect(dummy_post.permalink).to eq 'ruby_is_awesome'
      end
    end

    context 'given blank between title' do
      let(:dummy_post) { create :post, title: ' Ruby is Awesome    ' }
      it 'will strip blank char and generate valid permalink' do
        expect(dummy_post.permalink).to eq 'ruby_is_awesome'
      end
    end
  end

  describe '#content_to_html' do
    context 'given valid not empty content' do
      let(:dummy_post) { create :post, content: '### Hello' }
      it 'will generate valid html' do
        expect(dummy_post.content_to_html).to include '<h3>Hello</h3>'
      end
    end
    
    context 'given content with html tags' do
      let(:dummy_post) { create :post, content: '<div>hello</div>' }
      it 'will omit the html tags and wrap it as paragraph' do
        expect(dummy_post.content_to_html).to include '<p>hello</p>'
      end
    end
  end
end
