require 'spec_helper'

describe User do
  describe '#show_display_name' do
    let(:user) do 
      User.new email: 'johndoe@example.com', password: 'secret', password_confirmation: 'secret'
    end

    describe 'given valid and present display_name' do
      it 'will return display_name' do
        user.display_name = 'John Doe'
        expect(user.show_display_name).to eq 'John Doe'
      end
    end

    describe 'given nil display_name' do
      it 'will return email' do
        user.display_name = nil
        expect(user.show_display_name).to eq user.email
      end
    end

    describe 'given empty display_name' do
      it 'will return email' do
        user.display_name = nil
        expect(user.show_display_name).to eq user.email
      end
    end

    describe 'given blank display_name' do
      it 'will return email' do
        user.display_name = nil
        expect(user.show_display_name).to eq user.email
      end
    end
  end
end