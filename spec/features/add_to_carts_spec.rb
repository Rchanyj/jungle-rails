require 'rails_helper'

RSpec.feature "Visitor clicks 'add' button on product on home page", type: :feature, js: true do

  #setup
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Visit clicks add, cart should update to (1)" do
    #act
    visit root_path
    first('article.product').find_link('Add').click

    #Debug
    #save_screenshot

    #verify
    expect(page).to have_css 'ul.nav.navbar-nav.navbar-right', text: 'My Cart (1)'
    #save_screenshot
  end

end
