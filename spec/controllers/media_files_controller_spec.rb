require 'rails_helper'

RSpec.describe MediaFilesController, type: :controller do

  let!(:user){ FactoryBot.create(:user)}
  let(:valid_attributes) do
    { 
      "description" => "MyText", 
      "user_id" => user.id,
    }
  end

  let(:invalid_attributes) do
    {
      "descrdiptifon" => "MyText", 
      "files" => "erer"
    }
  end

  let!(:blob) do
    ActiveStorage::Blob.create(
      key: "string",
      filename: "string",
      content_type: "string",
      metadata: "text",
      byte_size: 3874,
      checksum: 'string',
    )
  end

  # let!(:media_file){ MediaFile.create! valid_attributes }

  # let!(:active_attachment) do
  #   ActiveStorage::Attachment.create(
  #     name: "files",
  #     record_type: "MediaFile",
  #     record_id:  4,
  #     blob_id: blob.id,
  #   )
  # end
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MediaFilesController. Be sure to keep this updated too.
  let(:valid_session) { sign_in user }
  

  describe "GET #index" do
    it "returns a success response" do  
      MediaFile.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end


  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
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
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { media_file: invalid_attributes }, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

  # describe "DELETE #destroy" do
  #   it "destroys the requested media_file" do    
      
  #     binding.pry
      
  #     expect do
  #       delete :destroy, params: {
  #         id: active_attachment.to_param,
  #       }, session: valid_session
  #     end.to change(ActiveStorage::Attachment, :count).by(-1)
  #   end

  #   it "redirects to the media_files list" do
      
  #     delete :destroy, params: {
  #       id: active_attachment.to_param,
  #     }, session: valid_session
  #     expect(response).to redirect_to(media_files_url)
  #   end
  # end
end
