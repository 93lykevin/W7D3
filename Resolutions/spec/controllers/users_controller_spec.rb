require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe 'GET #index' do
    it 'renders the index view' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders the show view' do
      get :show, params: { id: 5 } 
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'renders the new view' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  # describe 'GET #new' do
  #   it 'renders the new view' do
  #     get :new
  #     expect(response).to render_template(:new)
  #   end
  # end

  # describe 'GET #new' do
  #   it 'renders the new view' do
  #     get :new
  #     expect(response).to render_template(:new)
  #   end
  # end

  describe 'POST #create' do
    it 'creates a new user' do
      post :create, params: { "user[username]" => "Ronil", "user[password]" => "password123" }
      expect(User.find_by(username: "Ronil")).to be_truthy
    end

    it 'redirects to the user''s page' do
      post :create, params: { "user[username]" => "Ronil", "user[password]" => "password123" }
      expect(response).to render_template(:show)
    end

  end

  describe 'DELETE #destroy' do
    subject(:ronil) { User.create(
    username: 'Ronil',
    password: 'password123'
    ) }
    it 'deletes user from database' do
      delete :destroy, params: { id: ronil.id }
      expect(User.find_by(username: 'Ronil')).to be_nil
    end

    subject(:ronil) { User.create(
    username: 'Ronil',
    password: 'password123'
    ) }
    it 'redirects user to sign up page' do
      delete :destroy, params: { id: ronil.id }
      expect(response).to render_template(:new)
    end
  end
end
