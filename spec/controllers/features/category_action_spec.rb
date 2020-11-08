# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Category action', type: :feature do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  before(:each) do
    login_as(admin, scope: :user)
  end

  context 'login as admin' do
    scenario 'should be successful' do
      visit root_path
      expect(page).to have_text('Posts for approval')
    end
  end

  context 'create new category' do
    let!(:post) { create(:post, status: Post.statuses[:new_post]) }
    let(:category) { create(:category) }
    scenario 'should be successful' do
      visit edit_post_path(post)
      page.find_field('post_category_attributes_title').set('new_cat')
      click_on 'Approved'
      expect(Category.count == 2).to eq(true)
    end
  end

  context 'delete category' do
    let!(:post) { create(:post, status: Post.statuses[:new_post]) }
    let(:category) { create(:category, id: 1, title: 'Sport') }
    let!(:category) { create(:category, id: 2, title: 'cat_for_delete') }
    scenario 'should be successful' do

      visit edit_post_path(post)
      click_link 'delete_category'
      expect(Category.count == 1).to eq(true)
      # expect(page).to have_text('cat_for_delete')
    end
  end
end
