require 'rails_helper'

RSpec.feature "Visitor clicks on a product on home page", type: :feature, js: true do

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

  scenario "Clicks on product, should see product details page" do
    #act
    visit root_path
    first('article.product').find('a.btn.btn-default.pull-right').click

    #Debug
    #save_screenshot

    #verify
    expect(page).to have_css 'section.products-show', count: 1
    #save_screenshot
  end

end
