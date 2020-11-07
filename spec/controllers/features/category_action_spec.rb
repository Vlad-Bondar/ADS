# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Action', type: :feature do
  context 'delete category' do
    let(:admin) { create(:admin) }
    scenario 'should be successful' do
      visit new_category_path
      fill_in 'title', with: 'category'
      click_on 'Create'
      expect(Category.count == 1).to eq(true)
    end
  end
end
