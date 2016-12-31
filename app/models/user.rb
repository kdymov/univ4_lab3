class User < ActiveRecord::Base
  has_many :recharges
  belongs_to :tariff
end
