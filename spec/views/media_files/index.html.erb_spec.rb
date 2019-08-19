require 'rails_helper'

RSpec.describe "media_files/index", type: :view do
  before(:each) do
    assign(:media_files, [
      MediaFile.create!(
        :name => "MyText",
        :user => nil
      ),
      MediaFile.create!(
        :name => "MyText",
        :user => nil
      ),
    ])
  end

  it "renders a list of media_files" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
