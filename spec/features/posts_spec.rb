require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'Only punbished posts' do
    create :post, title: "first"
    create :post, title: "second"
    create :post, :draft, title: "draft"
    visit '/'
    expect(page).to have_content "first"
    expect(page).to have_content "second"
    expect(page).not_to have_content "draft"
  end
end
