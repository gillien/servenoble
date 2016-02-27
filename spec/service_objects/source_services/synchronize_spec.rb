require 'rails_helper'

RSpec.describe SourceServices::Synchronize, type: :service_objects do
  let(:source)            { FactoryGirl.build_stubbed(:source) }
  let(:main_service)      { described_class.new(source) }
  let(:feed_jira_object)  {
    OpenStruct.new(
      entry_id:     'entry_id',
      url:          'http://url',
      summary:      'description',
      title:        'title',
      categories:   %w(cat1 cat2),
      author:       'Author',
      published_at: Time.now.utc
    )
  }

  describe 'call' do
    before :each do
      allow(Feedjira::Feed).to receive(:fetch_and_parse).and_return [feed_jira_object]
    end

    it 'creates one article and return the number of articles created' do
      expect(main_service.call).to eq 1
      expect(source.articles.first).not_to be_nil
    end
  end
end
