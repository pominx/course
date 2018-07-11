FactoryBot.define do

  factory :course do
      title "Rails"
      description "ga525"

    factory :course_ctrl do
      title "Ruby"
      description "ha518"
    end

    factory :course_view do
      title "test03"
      description "desc03"
    end

    factory :course_no_title do
      title ""
      description "desc03"
    end

    factory :course_no_desc do
      title "test03"
      description nil
    end

    factory :course_desc_abstract do
      title "test03"
      description "fatcat_fatcat_fatcat__not_abstract"
    end
    # sequence :title do |n|
    #   "title#{n}"
    # end

    # factory :course_model do
    #   title { |n| generate(:title) }
    # end

  end
end


