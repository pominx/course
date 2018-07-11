module CourseHelper
  def render_description
        if not @course.description.nil?
            @course.description
        else
            content_tag(:p, "No Description")
        end
   end
end
