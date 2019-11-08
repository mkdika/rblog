require 'spec_helper'

describe Comment do
  it 'should has default columns' do
    is_expected.to have_db_column(:name).of_type(:string)
    is_expected.to have_db_column(:email).of_type(:string)
    is_expected.to have_db_column(:content).of_type(:text)
    is_expected.to have_db_column(:post_id).of_type(:integer)
  end

  it 'should has indexes' do
    is_expected.to have_db_index [:post_id]
  end
end
