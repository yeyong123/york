# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  number     :string(255)
#  content    :text
#  use        :string(255)
#  load       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Product do
	before do 
		@product = Product.new(title: "foo",
																 number: "123456",
																 content: "foobar",
																 use: "bar",
																 :load => "barfoo")
	end
	subject{ @product }
	it { should respond_to(:title) }
	it { should respond_to(:number)}
	it { should respond_to(:content)}
	it { should respond_to(:use)}
	it { should respond_to(:load)}
	it { should be_valid }

	describe "当用户提交空的标题数据" do
		before { @product.title = " "}
		it { should_not be_valid }
	end

	describe "当用户提交空的货号" do
		before { @product.number = " "}
		it { should_not be_valid }
	end

	describe "当用户提交空的描述" do
		before { @product.content = " "}
		it { should_not be_valid }
	end

	describe "当用户提交空的使用范围" do
		before { @product.use = " "}
		it { should_not be_valid }
	end

	describe "载重量不能为空" do
		before { @product.load = " "}
		it { should_not be_valid }
	end

	describe "当标题的字超过了50个字" do
		before { @product.title = "a" * 51 }
		it { should_not be_valid }
	end

	describe "当标题已经有存在" do
		before do
			product_with_same_title = @product.dup
			product_with_same_title.title = @product.title
			product_with_same_title.save
	 end
		it { should_not be_valid }
	end

end
