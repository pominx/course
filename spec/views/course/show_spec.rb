require 'rails_helper'

RSpec.describe "courses/show.html.erb", type: :view do
  before(:each) do
    @course = FactoryBot.create :course_view
  end

  it "render when has no description" do
    @course = Course.create(title: "test01", description:  nil)
    render
    expect(rendered).to match("No Description")
  end

  it "render when has description" do
    allow(view).to receive(:render_description).and_return("bonbon")
    render
    expect(rendered).not_to match("No -- title")
    expect(rendered).not_to match("No -- description")
    expect(rendered).to match("bonbon")
  end

  it "include the controller action" do
    expect(controller.request.path_parameters[:action]).to eq("show")
  end

  it "has link" do
    render
    expect(rendered).to match("Edit")
    expect(rendered).to match("Back")
  end

end
