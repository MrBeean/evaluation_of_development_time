require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it 'renders root page' do
    visit root_path
    expect(page).to have_content('ᕙ༼*◕_◕*༽ᕤ')
  end
end
