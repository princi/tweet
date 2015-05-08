class Product < ActiveRecord::Base

  belongs_to :user
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


end

# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :decimal(, )
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
