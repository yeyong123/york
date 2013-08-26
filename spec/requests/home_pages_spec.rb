require 'spec_helper'

describe "HomePages" do
  describe "home page" do
    it "测试首页列表" do
      visit  root_path
      page.should have_content("首页")
			page.should have_content("产品中心")
			page.should have_content("关于我们")
			page.should have_content("联系我们")
    end
  end


end
