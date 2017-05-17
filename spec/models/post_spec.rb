# Post Model Specifications
require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:author) }
  it { should respond_to(:user_id) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:author) }

  describe 'destroy' do
    subject { FactoryGirl.create(:post) }

    it 'should flag the post as deleted' do
      expect(subject.deleted_at).to eq nil
      subject.destroy
      expect(subject.deleted_at).to_not eq nil
    end
  end
end
