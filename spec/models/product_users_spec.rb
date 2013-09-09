# == Schema Information
#
# Table name: product_users
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#

require 'spec_helper'

describe ProductUsers do
  pending "add some examples to (or delete) #{__FILE__}"
end
