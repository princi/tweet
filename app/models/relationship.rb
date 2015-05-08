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

class Relationship < ActiveRecord::Base
end
