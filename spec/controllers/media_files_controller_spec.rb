require 'rails_helper'

RSpec.describe MediaFilesController, type: :controller do
  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MediaFilesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      MediaFile.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      media_file = MediaFile.create! valid_attributes
      get :show, params: { id: media_file.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      media_file = MediaFile.create! valid_attributes
      get :edit, params: { id: media_file.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new MediaFile" do
        expect do
          post :create, params: { media_file: valid_attributes }, session: valid_session
        end.to change(MediaFile, :count).by(1)
      end

      it "redirects to the created media_file" do
        post :create, params: { media_file: valid_attributes }, session: valid_session
        expect(response).to redirect_to(MediaFile.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { media_file: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested media_file" do
        media_file = MediaFile.create! valid_attributes
        put :update, params: {
          id: media_file.to_param,
          media_file: new_attributes,
        }, session: valid_session
        media_file.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the media_file" do
        media_file = MediaFile.create! valid_attributes
        put :update, params: {
          id: media_file.to_param,
          media_file: valid_attributes,
        }, session: valid_session
        expect(response).to redirect_to(media_file)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        media_file = MediaFile.create! valid_attributes
        put :update, params: {
          id: media_file.to_param,
          media_file: invalid_attributes,
        }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested media_file" do
      media_file = MediaFile.create! valid_attributes
      expect do
        delete :destroy, params: {
          id: media_file.to_param,
        }, session: valid_session
      end.to change(MediaFile, :count).by(-1)
    end

    it "redirects to the media_files list" do
      media_file = MediaFile.create! valid_attributes
      delete :destroy, params: {
        id: media_file.to_param,
      }, session: valid_session
      expect(response).to redirect_to(media_files_url)
    end
  end
end
