require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:student) { create(:student) }
  describe "GET /student_dashboard" do
    context "after a student signs in" do
      before { sign_in student }
      it "returns http success" do
        student_path(student.id)
        expect(response).to have_http_status(:success)
      end
    end
  end

  #Also need to add test to check for redirect when someone logged in as a student tries to go to the mentor dashboard

end
