require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to belong_to(:user)  }
  end

  describe '#to_s' do
    let(:post) { FactoryGirl.build(:post) }
    it 'returns the correct value' do
      expect(post.to_s).to eq(post.title)
    end
  end
end
