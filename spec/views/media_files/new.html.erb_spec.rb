require 'rails_helper'

RSpec.describe "media_files/new", type: :view do
  before(:each) do
    assign(:media_file, MediaFile.new(
      :name => "MyText",
      :user => nil
    ))
  end

  it "renders new media_file form" do
    render

    assert_select "form[action=?][method=?]", media_files_path, "post" do
      assert_select "textarea[name=?]", "media_file[name]"

      assert_select "input[name=?]", "media_file[user_id]"
    end
  end
end
