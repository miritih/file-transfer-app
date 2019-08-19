require 'rails_helper'

RSpec.describe "media_files/show", type: :view do
  before(:each) do
    @media_file = assign(:media_file, MediaFile.create!(
      :name => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
