require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:user) { FactoryBot.build(:user) }
  let(:valid_attributes) {
    {
      user: user,
      title: Faker::Book.title,
      optimal_days: Faker::Number.decimal(2, 1),
      normal_days: Faker::Number.decimal(2, 1),
      pessimistic_days: Faker::Number.decimal(2, 1)
    }
  }

  let(:invalid_attributes) {
    {
      title: nil,
      optimal_days: nil,
      normal_days: nil,
      pessimistic_days: nil
    }
  }

  describe "GET #index" do
    login_user
    it "returns a success response" do
      Goal.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    login_user
    it "returns a success response" do
      goal = Goal.create! valid_attributes
      get :show, params: {id: goal.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    login_user
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    login_user
    it "returns a success response" do
      goal = Goal.create! valid_attributes
      get :edit, params: {id: goal.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      login_user
      it "creates a new Goal" do
        expect {
          post :create, params: {goal: valid_attributes}
        }.to change(Goal, :count).by(1)
      end

      it "redirects to the created goal" do
        post :create, params: {goal: valid_attributes}
        expect(response).to redirect_to(Goal.last)
      end
    end

    context "with invalid params" do
      login_user
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {goal: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      login_user
      let(:new_attributes) {
        {
          user: user,
          title: Faker::Book.title,
          optimal_days: Faker::Number.decimal(2, 1),
          normal_days: Faker::Number.decimal(2, 1),
          pessimistic_days: Faker::Number.decimal(2, 1)
        }
      }

      it "redirects to the goals after update" do
        goal = Goal.create! valid_attributes
        put :update, params: {id: goal.to_param, goal: valid_attributes}
        expect(response).to redirect_to(goals_path)
      end
    end

    context "with invalid params" do
      login_user
      it "returns a success response (i.e. to display the 'edit' template)" do
        goal = Goal.create! valid_attributes
        put :update, params: {id: goal.to_param, goal: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    login_user
    it "destroys the requested goal" do
      goal = Goal.create! valid_attributes
      expect {
        delete :destroy, params: {id: goal.to_param}
      }.to change(Goal, :count).by(-1)
    end

    it "redirects to the goals list" do
      goal = Goal.create! valid_attributes
      delete :destroy, params: {id: goal.to_param}
      expect(response).to redirect_to(goals_url)
    end
  end

  describe "PUT #update_fact_day" do
    context "with valid params" do
      login_user
      let(:new_fact_attributes) {
        {
          fact_days: Faker::Number.decimal(2, 1)
        }
      }

      it "redirects to the goals after update" do
        goal = Goal.create! valid_attributes
        put :update_fact_day, params: {id: goal.to_param, goal: valid_attributes}
        expect(response).to be_successful
      end
    end

    context "with invalid params" do
      login_user

      let(:invalid_fact_attributes) {
        {
          fact_days: nil
        }
      }
      it "returns a success response (i.e. to display the 'edit' template)" do
        goal = Goal.create! valid_attributes
        put :update_fact_day, params: {id: goal.to_param, goal: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end
end
