require 'spec_helper'

describe "ProductsPages" do
  describe "index" do
    it "在全部产品显示的页面上应该能看到的东西" do
      visit products_path
      page.should have_selector('td', text: "货号")
			page.should have_selector('td', text: "标题")
    end
  end
end
