require 'rails_helper'

RSpec.describe "courses/index.html.erb", type: :view do
  before(:each) do
    @course = FactoryBot.create :course_view
  end

  it 'does render' do
    @courses = Array.new(1, @course)
    render
    expect(rendered).to match "test03"
    expect(rendered).to match "desc03"
  end

  it "include the controller action" do
    expect(controller.request.path_parameters[:action]).to eq("index")
  end

  it "include the controller path" do
    expect(controller.controller_path).to eq("courses")
  end
end
