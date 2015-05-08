class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products

  has_many :rate_relationships, class_name: 'Relationship', foreign_key: 'unrate_id'
  has_many :unrate_relationships, class_name: 'Relationship', foreign_key: 'rate_id'
  has_many :rates, through: :rate_relationships
  has_many :unrates, through: :unrate_relationships


def rating? user
  self.unrates.include? user
end

def rat user
  Relationship.create rate_id: self.id,unrate_id: user.id
end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#
