require 'spec_helper.rb'

feature "Looking for sources", js: true do

  let!(:user)           { FactoryGirl.create(:user) }
  let(:source)          { FactoryGirl.create(:source) }
  let!(:baked_potato)   { FactoryGirl.create(:article, source: source, title: 'Baked Potato') }
  let!(:baked_sprouts)  { FactoryGirl.create(:article, source: source, title: 'Baked Brussel Sprouts') }
  
  background do
    login_with user
  end

  scenario "Search sources" do
    visit '/admin/'
    click_on "Sources"

    fill_in 'q_key_cont', with: source.id
    click_on "Search"

    click_on(source.description)
    expect(page).to have_content('Get last articles')
  end
end