require 'spec_helper'

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
  end

  describe '#permalink' do
    describe 'given valid title' do
      it 'will generate valid permalink' do
        post = Post.new title: 'Ruby is Awesome', content: 'testing.'
        expect(post.permalink).to eq 'ruby_is_awesome'
      end
    end

    describe 'given blank between title' do
      it 'will strip blank char and generate valid permalink' do
        post = Post.new title: ' Ruby is Awesome    ', content: 'testing.'
        expect(post.permalink).to eq 'ruby_is_awesome'
      end
    end

    describe 'given valid title and generated permalink' do
      let(:category) { Category.create name: 'Dumb'}
      let(:user) { User.create email: 'john@example.com', password: 'abc', password_confirmation: 'abc' }

      after do
        post = Post.last
        post.destroy
        category.destroy
        user.destroy
      end
    
      it 'will save the permalink into database correctly' do
        post = Post.new title: 'Dummy title 123', content: 'testing', category: category, user: user
        post.save
        generated_permalink = 'dummy_title_123'
        expect(post.permalink).to eq generated_permalink
        current_data = Post.where(permalink: generated_permalink)
        expect(current_data.present?).to eq true
      end
    end
  end
end
