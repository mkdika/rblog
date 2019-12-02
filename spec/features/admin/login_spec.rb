require 'rails_helper'
require 'spec_helper'

describe 'admin/login' do
  let(:existing_user) { create :user }
  context 'given valid email and password' do
    it 'will login successfully and redirect to admin dashboard' do
      visit '/admin/login'
      fill_in 'user_email', with: existing_user.email
      fill_in 'user_password', with: 'password'
      click_button 'Login'
      expect(current_path).to eq '/admin'
      expect(page).to have_content 'Dashboard'
    end
  end

  context 'given invalid email' do
    it 'will pop notice banner and still on login page' do
      visit '/admin/login'
      fill_in 'user_email', with: 'invalid_email@example.com'
      fill_in 'user_password', with: 'password'
      click_button 'Login'
      expect(current_path).to eq '/admin/login'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end

  context 'given invalid password' do
    it 'will pop notice banner and still on login page' do
      visit '/admin/login'
      fill_in 'user_email', with: existing_user.email
      fill_in 'user_password', with: 'wrong_password'
      click_button 'Login'
      expect(current_path).to eq '/admin/login'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end

  context 'click on Forget your password link' do
    it 'will redirect to Forget your password page' do
      visit '/admin/login'
      click_link 'Forgot your password?'
      expect(current_path).to eq '/admin/password/new'
      expect(page).to have_content 'Forgot your password?'
    end
  end

  context 'click on Didnt receive unlock instruction link' do
    it 'will redirect to Didnt receive unlock instruction page' do
      visit '/admin/login'
      click_link "Didn't receive unlock instructions?"
      expect(current_path).to eq '/admin/unlock/new'
      expect(page).to have_content 'Resend unlock instructions'
    end
  end
end
