require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # it "tests that a product with all four fields filled will save" do
    it "permit a product with name & price & quantity & category" do
      category = Category.new(:name => "Furniture")
      product = Product.new(:name => "Chair", :price => 2000, :quantity => 25, :category => category)
      expect(product).to be
    end

    it 'checks product has a name' do
      category = Category.new(:name => "Furniture")
      product = Product.new(:name => nil, :price => 2000, :quantity => 25, :category => category)
      expect(product.valid?).to be_falsey
    end

    it 'checks product has a price' do
      category = Category.new(:name => "Furniture")
      product = Product.new(:name => "Chair", :price => nil, :quantity => 25, :category => category)
      expect(product.valid?).to be_falsey
    end

    it 'reject if quantity is nil/absent' do
      category = Category.new(:name => "Furniture")
      product = Product.new(:name => "Chair", :price => 2000, :quantity => nil, :category => category)
      expect(product.valid?).to be_falsey
    end

    it 'checks product has a category' do
      category = Category.new(:name => "Furniture")
      product = Product.new(:name => "Chair", :price => 2000, :quantity => 25, :category => nil)
      expect(product.valid?).to be_falsey
    end
  end
end
