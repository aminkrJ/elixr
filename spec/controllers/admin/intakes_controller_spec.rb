require 'rails_helper'

RSpec.describe Admin::IntakesController, type: :controller do
  before(:each) do
    login_with(create(:admin), :admin)
  end

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all intakes as @intakes" do
      intake = Intake.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:intakes)).to eq([intake])
    end
  end

  describe "GET #show" do
    it "assigns the requested intake as @intake" do
      intake = Intake.create! valid_attributes
      get :show, {:id => intake.to_param}, valid_session
      expect(assigns(:intake)).to eq(intake)
    end
  end

  describe "GET #new" do
    it "assigns a new intake as @intake" do
      get :new, {}, valid_session
      expect(assigns(:intake)).to be_a_new(Intake)
    end
  end

  describe "GET #edit" do
    it "assigns the requested intake as @intake" do
      intake = Intake.create! valid_attributes
      get :edit, {:id => intake.to_param}, valid_session
      expect(assigns(:intake)).to eq(intake)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Intake" do
        expect {
          post :create, {:intake => valid_attributes}, valid_session
        }.to change(Intake, :count).by(1)
      end

      it "assigns a newly created intake as @intake" do
        post :create, {:intake => valid_attributes}, valid_session
        expect(assigns(:intake)).to be_a(Intake)
        expect(assigns(:intake)).to be_persisted
      end

      it "redirects to the created intake" do
        post :create, {:intake => valid_attributes}, valid_session
        expect(response).to redirect_to(Intake.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved intake as @intake" do
        post :create, {:intake => invalid_attributes}, valid_session
        expect(assigns(:intake)).to be_a_new(Intake)
      end

      it "re-renders the 'new' template" do
        post :create, {:intake => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested intake" do
        intake = Intake.create! valid_attributes
        put :update, {:id => intake.to_param, :intake => new_attributes}, valid_session
        intake.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested intake as @intake" do
        intake = Intake.create! valid_attributes
        put :update, {:id => intake.to_param, :intake => valid_attributes}, valid_session
        expect(assigns(:intake)).to eq(intake)
      end

      it "redirects to the intake" do
        intake = Intake.create! valid_attributes
        put :update, {:id => intake.to_param, :intake => valid_attributes}, valid_session
        expect(response).to redirect_to(intake)
      end
    end

    context "with invalid params" do
      it "assigns the intake as @intake" do
        intake = Intake.create! valid_attributes
        put :update, {:id => intake.to_param, :intake => invalid_attributes}, valid_session
        expect(assigns(:intake)).to eq(intake)
      end

      it "re-renders the 'edit' template" do
        intake = Intake.create! valid_attributes
        put :update, {:id => intake.to_param, :intake => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested intake" do
      intake = Intake.create! valid_attributes
      expect {
        delete :destroy, {:id => intake.to_param}, valid_session
      }.to change(Intake, :count).by(-1)
    end

    it "redirects to the intakes list" do
      intake = Intake.create! valid_attributes
      delete :destroy, {:id => intake.to_param}, valid_session
      expect(response).to redirect_to(intakes_url)
    end
  end

end
