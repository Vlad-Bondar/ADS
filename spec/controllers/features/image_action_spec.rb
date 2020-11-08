# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Image action', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:category) { create(:category) }
  before(:each) do
    login_as(user, scope: :user)
  end
=begin
  context 'upload image' do
    let!(:post) { create(:post) }
    let(:category) { create(:category) }
    scenario 'should de successful' do
      visit edit_post_path(post)

      attach_file('post_images', 'spec/images/test_image.png')
      click_on 'Update Post'

      expect(post.images.count == 1).to eq(true)
    end
  end
=end
end
