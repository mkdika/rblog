require 'spec_helper'
require 'rails_helper'

describe User do

  it 'should has default columns' do
    is_expected.to have_db_column(:email).of_type(:string)
    is_expected.to have_db_column(:encrypted_password).of_type(:string)
    is_expected.to have_db_column(:reset_password_token).of_type(:string)
    is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime)
    is_expected.to have_db_column(:remember_created_at).of_type(:datetime)
    is_expected.to have_db_column(:locked_at).of_type(:datetime)
    is_expected.to have_db_column(:failed_attempts).of_type(:integer)
    is_expected.to have_db_column(:display_name).of_type(:string)
  end

  it 'should has indexes' do
    is_expected.to have_db_index [:email]
    is_expected.to have_db_index [:reset_password_token]
  end

  describe '#paper_trail' do
    context 'with has_paper_trail attribute' do
      let(:dummy_data) { create :user }
      it 'will has association with the versions table and has data' do
        expect(dummy_data.versions.present?).to eq true
      end
    end
  end

  describe '#show_display_name' do
    context 'given valid and present display_name' do
      let(:dummy_user) { create :user }
      it 'will return display_name' do
        expect(dummy_user.show_display_name).to eq dummy_user.display_name
      end
    end

    context 'given nil display_name' do
      let(:dummy_user) { create :user, :without_display_name }
      it 'will return email' do
        expect(dummy_user.show_display_name).to eq dummy_user.email
      end
    end

    context 'given blank display_name' do
      let(:dummy_user) { create :user, display_name: '   ' }
      it 'will return email' do
        expect(dummy_user.show_display_name).to eq dummy_user.email
      end
    end
  end

  describe '#locked?' do
    context 'given DateTime value to locked_at' do
      let(:dummy_user) { create :user, :locked }
      it 'will return true' do
        expect(dummy_user.locked?).to eq true
      end
    end

    context 'given nil value to locked_at' do
      let(:dummy_user) { create :user, locked_at: nil }
      it 'will return false' do
        expect(dummy_user.locked?).to eq false
      end
    end
  end
end
