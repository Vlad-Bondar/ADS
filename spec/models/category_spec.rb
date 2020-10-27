# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validaton test' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to have_many(:posts) }
  end
end
