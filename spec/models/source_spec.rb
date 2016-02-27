require 'rails_helper'

RSpec.describe Source, type: :model do
  subject(:source) { FactoryGirl.build(:source) }

  it { expect(source).to be_valid }
end
