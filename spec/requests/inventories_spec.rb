# spec/controllers/inventories_controller_spec.rb

RSpec.describe InventoriesController, type: :controller do
  let(:user) { User.create(name: 'test_user', email: 'test@example.com', password: 'password') }
  let(:inventory) { user.inventories.create(name: 'Test Inventory') }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns user inventories as @inventories' do
      get :index
      expect(assigns(:inventories)).to eq([inventory])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested inventory as @inventory' do
      get :show, params: { id: inventory.to_param }
      expect(assigns(:inventory)).to eq(inventory)
    end

    it 'renders the show template' do
      get :show, params: { id: inventory.to_param }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new inventory as @inventory' do
      get :new
      expect(assigns(:inventory)).to be_a_new(Inventory)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Inventory' do
        expect do
          post :create, params: { inventory: { name: 'New Inventory' } }
        end.to change(Inventory, :count).by(1)
      end

      it 'redirects to the created inventory' do
        post :create, params: { inventory: { name: 'New Inventory' } }
        expect(response).to redirect_to(Inventory.last)
      end
    end

    context 'with invalid params' do
      it 'does not save the new inventory' do
        expect do
          post :create, params: { inventory: { name: '' } }
        end.to_not change(Inventory, :count)
      end

      it 're-renders the "new" template' do
        post :create, params: { inventory: { name: '' } }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested inventory' do
      inventory_to_destroy = user.inventories.create(name: 'Inventory to destroy')
      expect do
        delete :destroy, params: { id: inventory_to_destroy.to_param }
      end.to change(Inventory, :count).by(-1)
    end

    it 'redirects to the inventories list' do
      delete :destroy, params: { id: inventory.to_param }
      expect(response).to redirect_to(inventories_url)
    end
  end
end
