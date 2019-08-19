require 'rails_helper'

RSpec.describe "media_files/edit", type: :view do
  before(:each) do
    @media_file = assign(:media_file, MediaFile.create!(
      :name => "MyText",
      :user => nil
    ))
  end

  it "renders the edit media_file form" do
    render

    assert_select "form[action=?][method=?]", media_file_path(@media_file), "post" do
      assert_select "textarea[name=?]", "media_file[name]"

      assert_select "input[name=?]", "media_file[user_id]"
    end
  end
end
