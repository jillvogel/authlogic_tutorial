class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :name, :email, :password, :password_confirmation
end
