require 'rails_helper'

RSpec.describe User, :type => :model do
  subject(:user) { FactoryGirl.build(:user) }

  it { expect(user).to be_valid }
end
