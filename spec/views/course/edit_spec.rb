require 'rails_helper'

RSpec.describe "courses/edit.html.erb", type: :view do
    before(:each) do
        @course = FactoryBot.create(:course_view)
    end

    it "render partial" do
        render
        expect(response).to render_template(partial: "_form")
    end

    it "includes the controller action" do
        expect(controller.request.path_parameters[:action]).to eq("edit")
    end

    it "has link" do
        render
        expect(rendered).to match("Show")
        expect(rendered).to match("Back")
    end

end
