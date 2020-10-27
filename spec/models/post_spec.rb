# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to validate_presence_of(:header) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:category) }

  context 'validaton' do
    describe '#content_presence ' do
      let(:post) { Post.new }

      before do
        post.valid?
      end

      it 'ensure body is empty' do
        post.header = 'Test header'
        post.valid?
        expect(post.errors.full_messages).to include("Body can't be blank")
      end

      it 'ensure header is empty' do
        post.body = 'Test body'
        post.valid?
        expect(post.errors.full_messages).to include("Header can't be blank")
      end

      # ??
      it 'ensure post has category by default' do
        post.header = 'Test header'
        post.body = 'Test body'
        expect(post.category_id).to eq(1)
      end
    end
  end
=begin
  context 'change status' do
    it 'should be publish' do
      post = Post.create(header: 'Test header', body: 'Test body', user_id: 1, status: 'approved')
      Post.publish_posts
      expect(post.status == Post.statuses[:publish]).to eq(true)
    end

    it 'shouldn`t be publish' do
      post = Post.create(header: 'Test header', body: 'Test body', status: 'new_post')
      Post.publish_posts
      expect(post.status?).not_to eq(Post.statuses[:publish])
    end
  end
=end
end
