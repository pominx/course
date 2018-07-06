require 'rails_helper'

RSpec.describe CoursesController do
  let!(:course) { FactoryBot.create :course }


    describe "GET index" do
      it "assigns @courses" do

        course1 = Course.create(title: "test01", description: "desc01")
        course2 = Course.create(title: "test02", description: "desc02")
        get :index
        expect(assigns[:courses]).to eq([course, course1, course2])

      end
      it "renders index template" do
        get :index
        expect(response).to render_template("index")
      end
    end

    describe "GET show" do
      it "assigns @course" do
        get :show, params: { id: course.id }
        expect(assigns[:course]).to eq(course)
      end
      it "render show template" do
        get :show, params: { id: course.id }
        expect(response).to render_template("show")
      end
    end

    describe "GET new" do
      it "assign @course" do
        get :new
        expect(assigns(:course)).to be_a_new(Course)
      end
      it "render new template" do
        get :new
        expect(response).to render_template("new")
      end

    end

    describe "POST create" do
      context "when course doesn't have title" do
        it "doesn't create a record " do
          expect do
          post :create, params: { course: { :description => "test01" } }
          end.to change { Course.count }.by(0)
        end
        it "render new template " do
          post :create, params: { course: { :description => "test01" } }
          expect(response).to render_template("new")
        end
      end

      context "when course has title" do
        it "create a new course record" do
          course = build(:course)
          expect do
          post :create, params: { course: attributes_for(:course) }
          end.to change { Course.count }.by(1)
        end

        it "redirects to courses_path" do
          course = build(:course)
          post :create, params:{ course: attributes_for(:course) }
          expect(response).to redirect_to courses_path
        end
      end
    end

    describe "GET edit" do
      it "assign course" do
        get :edit, params: { id: course.id }
        expect(assigns[:course]).to eq(course)
      end
      it "render edit template" do
        get :edit, params: { id: course.id }
        expect(response).to render_template("edit")
      end
    end

    describe "PUT update" do
      context "when course have title" do
        it "assign @course" do
          put :update, params: { id: course.id, course: { title: "test01", description: "desc01" } }
          expect(assigns[:course]).to eq(course)
        end

        it "changes value" do
          put  :update, params: { id: course.id, course: { title: "test01", description: "desc01" } }
          expect(assigns[:course].title).to eq("test01")
          expect(assigns[:course].description).to eq("desc01")
        end

        it "redirect path " do
          put :update, params: { id: course.id, course: { title: "test01", description: "desc01" } }
          expect(response).to redirect_to course_path(course)
        end
      end

      context "when course haven't title" do
        it "dosen't update course record" do
          put :update, params: { id: course.id, course: { title: "", description: "desc01" } }
          expect(course.description).not_to eq("desc01")
        end
        it "renders edit template" do
          put :update, params: { id: course.id, course: { title: "", description: "desc01" } }
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do

      it "assigns @course" do
        delete :destroy, params: { id: course.id }
        expect(assigns[:course]).to eq(course)
      end
      it "delete record" do
        expect do
          delete :destroy, params: { id: course.id}
          end.to change { Course.count }.by(-1)
      end
      it "render template" do
        delete :destroy, params: { id: course.id }
        expect(response).to redirect_to courses_path
      end
    end
end
