require "rails_helper"
RSpec.describe "Course" , :type => :routing do
  it "#index" do
    expect(get: "/courses").to route_to("courses#index")
  end

  it "#show" do
    expect(:get => "/courses/1").to route_to(
      :controller => "courses",
      :action => "show",
      :id => "1"
      )
  end

  it "#create" do
    expect(:post => "/courses").to route_to(
      :controller => "courses",
      :action => "create"
      )
  end
  it "#last_course" do
    expect(:get => "/courses/last_course").to route_to(
      :controller => "courses",
      :action => "last_course"
      )
  end

  it "root" do
    expect(get: courses_path).to route_to(
      :controller => "courses",
      :action => "index"
      )
  end

  it "does not route to courses/gaga/tata" do
    expect(:get => "/widgets/gaga/tata").not_to be_routable
  end

  it " route to courses/" do
    expect(:get => "/courses").to be_routable
  end



end
