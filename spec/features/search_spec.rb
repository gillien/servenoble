require 'spec_helper.rb'

feature "Looking for articles", js: true do

  let!(:user)           { FactoryGirl.create(:user) }
  let(:source)          { FactoryGirl.create(:source) }
  let!(:baked_potato)   { FactoryGirl.create(:article, source: source, title: 'Baked Potato') }
  let!(:baked_sprouts)  { FactoryGirl.create(:article, source: source, title: 'Baked Brussel Sprouts') }
  
  before :each do
    visit '/'

    fill_in "user_email",     with: user.email
    fill_in "user_password",  with: user.password

    click_on "Sign in"
  end

  scenario "finding recipes" do
    visit '/'

    fill_in 'keywords', with: 'baked'
    click_on "Search"

    expect(page).to have_content("Baked Potato")
    expect(page).to have_content("Baked Brussel Sprouts")

    fill_in 'keywords', with: 'RoBake'
    click_on "Search"

    expect(page).not_to have_content("Baked Potato")
  end
end