require 'rails_helper'

RSpec.describe Course, type: :model do
let(:course_with_desc) { FactoryBot.create :course_view }
let(:course_without_desc) { FactoryBot.create :course_no_desc }

  describe  do
    context "associations" do
      it { should validate_presence_of(:title) }
      it { should have_many(:comments) }
    end

    it "validates title" do
      expect(Course.new).not_to be_valid
      expect(Course.new(:title => "title")).to be_valid
    end

    it ".no_describe" do
      # course_with_desc = FactoryBot.create (:course_view)
      # course_without_desc = FactoryBot.create (:course_no_desc)
      expect(Course.no_describe).to include course_without_desc
      expect(Course.no_describe).not_to include course_with_desc
    end

    it "#abstract" do
      course = FactoryBot.create (:course_desc_abstract)
      #course = Course.create(:title => "title", :description => "fatcat_fatcat_fatcat_not_abstract")
      expect(course.abstract).to include("fatcat_fatcat_fatcat")
      expect(course.abstract).not_to include("not_abstract")
    end
  end
end
