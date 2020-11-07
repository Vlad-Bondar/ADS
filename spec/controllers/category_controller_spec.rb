# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  context 'POST create' do
    let!(:category) { create :category }
    it 'should de create' do
      expect(Category.count == 1).to eq(true)
    end
    it 'should be delete' do
      category.destroy
      expect(Category.count == 0).to eq(true)
    end
  end
end
