# User Model Specifications
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should have_many(:posts) }

  describe 'display_name' do
    subject { FactoryGirl.create(:user) }

    it 'returns first and last name' do
      expect(subject.display_name).to eq "#{subject.first_name} #{subject.last_name}"
    end
  end
end
