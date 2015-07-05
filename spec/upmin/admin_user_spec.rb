require 'rails_helper'

RSpec.describe AdminUser do
  let(:user)      { FactoryGirl.create(:user) }
  subject(:upmin) { described_class.new(user) }

  it { expect(upmin).to be_valid }

  describe 'Update password' do
    context 'valid user' do
      it { expect(upmin.update_password('new_password')).to eq 'Password updated succesfully' }
    end

    context 'invalid user' do
      it { expect(upmin.update_password(nil)).not_to eq 'Password updated succesfully' }
    end
  end
end
