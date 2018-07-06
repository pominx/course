require 'rails_helper'

RSpec.describe "courses/index.html.erb", type: :view do
  it 'render' do
    @course = Course.create(:title => "Title", :description => "content")
    @courses = Array.new(2, @course)
    render
    expect(rendered).to include("Title")
    expect(rendered).to include("content")
  end


  it "include the controller action" do
    expect(controller.request.path_parameters[:action]).to eq("index")
  end




end
