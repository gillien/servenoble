require 'rails_helper'

RSpec.describe AdminSource do
  let(:source)    { FactoryGirl.build(:source) }

  subject(:upmin) { described_class.new(source) }

  it { expect(upmin).to be_valid }

  describe 'Source synchronization' do
    before :each do
      expect_any_instance_of(SourceServices::Synchronize).
        to receive(:call).and_return 1
    end

    it { expect(upmin.get_last_articles).to eq '1 article(s) created' }
  end
end
