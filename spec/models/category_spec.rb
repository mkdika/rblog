require 'spec_helper'

describe Category do
  it 'should has default columns' do
    is_expected.to have_db_column(:name).of_type(:string)
  end
end
