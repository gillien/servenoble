module FeaturesMacros
  def logout
    expect(page).to have_selector('ul.nav.navbar-nav')

    within('.nav.navbar-nav') do
      find('#more_links').click
      click_on 'Logout'
    end
  end

  def login_with(user)
    visit '/'

    fill_in 'user_email',     with: user.email
    fill_in 'user_password',  with: user.password

    click_on 'Sign in'
  end
end
