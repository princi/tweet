# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  rate_id    :integer
#  unrate_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
