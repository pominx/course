require "rails_helper"

RSpec.describe "courses/_form" do
  it "form has no action " do
    expect(controller.request.path_parameters[:action]).to be_nil
  end
end

