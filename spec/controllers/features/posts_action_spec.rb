# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Post action', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:category) { create(:category) }
  before(:each) do
    login_as(user, scope: :user)
  end

  context 'index'  do
    scenario 'Should see all posts' do
      visit root_path
      expect(page).to have_text('Users posts')
    end
  end

  context 'new' do
    scenario 'Should see new post' do
      visit new_post_path
      expect(page).to have_text('New Post')
    end
  end

  context 'create post' do
    let!(:category) { create(:category, id: 1) }
    scenario 'should be successful' do
      visit new_post_path

      fill_in 'post[header]', with: 'new header'
      fill_in 'post[body]', with: 'body'

      click_on 'Save as draft'

      expect(page).to have_content('new header')
    end
  end

  context 'edit' do
    scenario 'should be successful' do
      visit edit_post_path(post)
      fill_in 'post[header]', with: 'new'
      click_on 'Save as draft'
      expect(page).to have_content('new')
    end
  end
end
