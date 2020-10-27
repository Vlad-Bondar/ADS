# frozen_string_literal: true

require 'rails_helper'
# require 'spec_helper'

RSpec.describe PostsController, type: :controller do
  context 'GET index' do
    it 'should return success' do
      post = create(:post)
      get :index
      assert_response :success
    end
  end

  context 'GET show' do
    it 'should return success' do
      post = create(:post)
      get :show, params: { id: post.id }
      assert_response :success
    end

    it 'should return 404' do
      post = create(:post, { id: 1 })
      assert_raises(ActiveRecord::RecordNotFound) do
        get :show, params: { id: 0 }
      end
    end
  end

  context 'POST create' do
    it 'create is success' do
      post = create(:post)
      post2 = create(:post)
      expect { Post.count == 2 }.to eq(true)
    end

    it 'dosent create'
    post = create(:post, header: '')
  end
end
