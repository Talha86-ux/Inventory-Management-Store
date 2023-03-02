require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /index" do
    it "assigns @products" do
      product = Product.create
      get :index
      expect(assigns(:products)).to eq([product])
    end

    it "renders the index template" do 
      get :index
      expect(response).to render_template("index")
    end
  end
end
