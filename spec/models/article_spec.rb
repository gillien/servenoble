require 'rails_helper'

RSpec.describe Article, :type => :model do
  let(:source)      { FactoryGirl.build(:source) }
  subject(:article) { FactoryGirl.build(:article, source: source) }

  it { expect(article).to be_valid }
end
