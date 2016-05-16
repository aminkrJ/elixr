require 'rails_helper'

RSpec.describe Admin::CooksController, type: :controller do

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
    it "assigns all cooks as @cooks" do
      cook = Cook.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:cooks)).to eq([cook])
    end
  end

  describe "GET #show" do
    it "assigns the requested cook as @cook" do
      cook = Cook.create! valid_attributes
      get :show, {:id => cook.to_param}, valid_session
      expect(assigns(:cook)).to eq(cook)
    end
  end

  describe "GET #new" do
    it "assigns a new cook as @cook" do
      get :new, {}, valid_session
      expect(assigns(:cook)).to be_a_new(Cook)
    end
  end

  describe "GET #edit" do
    it "assigns the requested cook as @cook" do
      cook = Cook.create! valid_attributes
      get :edit, {:id => cook.to_param}, valid_session
      expect(assigns(:cook)).to eq(cook)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cook" do
        expect {
          post :create, {:cook => valid_attributes}, valid_session
        }.to change(Cook, :count).by(1)
      end

      it "assigns a newly created cook as @cook" do
        post :create, {:cook => valid_attributes}, valid_session
        expect(assigns(:cook)).to be_a(Cook)
        expect(assigns(:cook)).to be_persisted
      end

      it "redirects to the created cook" do
        post :create, {:cook => valid_attributes}, valid_session
        expect(response).to redirect_to(Cook.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved cook as @cook" do
        post :create, {:cook => invalid_attributes}, valid_session
        expect(assigns(:cook)).to be_a_new(Cook)
      end

      it "re-renders the 'new' template" do
        post :create, {:cook => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested cook" do
        cook = Cook.create! valid_attributes
        put :update, {:id => cook.to_param, :cook => new_attributes}, valid_session
        cook.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested cook as @cook" do
        cook = Cook.create! valid_attributes
        put :update, {:id => cook.to_param, :cook => valid_attributes}, valid_session
        expect(assigns(:cook)).to eq(cook)
      end

      it "redirects to the cook" do
        cook = Cook.create! valid_attributes
        put :update, {:id => cook.to_param, :cook => valid_attributes}, valid_session
        expect(response).to redirect_to(cook)
      end
    end

    context "with invalid params" do
      it "assigns the cook as @cook" do
        cook = Cook.create! valid_attributes
        put :update, {:id => cook.to_param, :cook => invalid_attributes}, valid_session
        expect(assigns(:cook)).to eq(cook)
      end

      it "re-renders the 'edit' template" do
        cook = Cook.create! valid_attributes
        put :update, {:id => cook.to_param, :cook => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cook" do
      cook = Cook.create! valid_attributes
      expect {
        delete :destroy, {:id => cook.to_param}, valid_session
      }.to change(Cook, :count).by(-1)
    end

    it "redirects to the cooks list" do
      cook = Cook.create! valid_attributes
      delete :destroy, {:id => cook.to_param}, valid_session
      expect(response).to redirect_to(cooks_url)
    end
  end

end
