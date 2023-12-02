# require 'rails_helper'

# RSpec.describe RegistrationsController, type: :controller do
#   describe 'POST #create' do
#     it 'permits the name parameter for sign up' do
#       expect(controller).to receive(:configure_sign_up_params).and_call_original

#       user_params = {
#         email: 'test@example.com',
#         password: 'password',
#         password_confirmation: 'password',
#         name: 'Test User'
#       }

#       post :create, params: { user: user_params }
#       created_user = User.last
#       expect(created_user.name).to eq('Test User')
#     end
#   end
# end
