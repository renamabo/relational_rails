require 'rails_helper'

RSpec.describe 'the dog park show page' do
  before(:each) do
    @park_1 = DogPark.create!(name: "Woofs and Wags",
                            capacity: 25,
                            off_leash: false,
                            food: true)
    @park_2 = DogPark.create!(name: "Puppy Prairie",
                            capacity: 50,
                            off_leash: true,
                            food: false)
  end

  it 'displays the dog park name' do
    visit "/dog-parks/#{@park_1.id}"

    expect(page).to have_content(@park_1.name)
    expect(page).to_not have_content(@park_2.name)
  end

  it 'displays the dog park capacity' do
    visit "/dog-parks/#{@park_1.id}"

    expect(page).to have_content(@park_1.capacity)
    expect(page).to_not have_content(@park_2.capacity)
  end

  it 'displays if the dog park is off leash' do
    visit "/dog-parks/#{@park_1.id}"
    save_and_open_page

    expect(page).to have_content('Off Leash Park: false')
    expect(page).to_not have_content('Off Leash Park: true')
  end

  it 'displays if the dog park provides food' do
    visit "/dog-parks/#{@park_1.id}"

    expect(page).to have_content('Food for sale: true')
    expect(page).to_not have_content('Food for sale: false')
  end
end
