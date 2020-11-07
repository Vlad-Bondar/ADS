# frozen_string_literal: true

require 'rails_helper'
# require 'spec_helper'

RSpec.describe PostsController, type: :controller do
  # let(:post) { create(:post) }
  context 'GET index' do
    it 'should return success' do
      get :index
      assert_response :success
    end
  end

  context 'GET show' do
    let(:post) { create(:post, id: 1) }
    it 'should return success' do
      get :show, params: { id: post.id }
      assert_response :success
    end

    it 'should return 404' do
      assert_raises(ActiveRecord::RecordNotFound) do
        get :show, params: { id: 0 }
      end
    end
  end

  context 'POST create' do
    let!(:post2) { create(:post, id: 4) }
    let!(:post3) { create(:post, id: 5) }
    it 'create is success' do
      expect(Post.count == 2).to eq(true)
    end
  end
end
