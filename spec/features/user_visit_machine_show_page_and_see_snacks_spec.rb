require 'rails_helper'

describe 'user goes to show page and see snacks' do
  it "should have snanks and average price" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snack_1 = dons.snacks.create(name: "Doritos", price: 2.50 )
    snack_2 = dons.snacks.create(name: "Milky Way", price: 1.50 )
    snack_3 = dons.snacks.create(name: "Vaca Vieja", price: 1.00 )

    visit machine_path(dons)

    expect(current_path).to eq(machine_path(dons))
    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_2.price)
    expect(page).to have_content("Average price: 1.67")

  end
end
