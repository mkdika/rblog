require 'spec_helper'
require 'rails_helper'

describe Tagging do

  it 'should has default columns' do
    is_expected.to have_db_column(:tag_id).of_type(:integer)
    is_expected.to have_db_column(:post_id).of_type(:integer)
  end

  it 'should has indexes' do
    is_expected.to have_db_index [:post_id]
    is_expected.to have_db_index [:tag_id]
  end
end