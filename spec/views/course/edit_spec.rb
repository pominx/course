require 'rails_helper'

RSpec.describe "courses/edit.html.erb", type: :view do

    before(:each) do
        @course = Course.create(:title => "Title", :description => "content")
    end


    it "render partial" do
        render
        expect(response).to render_template(partial: "_form")
    end

    it "includes a link to new" do
        expect(controller.request.path_parameters[:action]).to eq("edit")

    end


end
