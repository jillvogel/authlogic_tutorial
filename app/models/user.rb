class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :name, :email, :password, :password_confirmation

  def active?
    active
  end
  
  def activate!
    self.active = true
    save
  end
  
  def deactivate!
    self.active = false
    save
  end
  
  def send_activation_instructions!
    reset_perishable_token!
    Notifier.activation_instructions(self).deliver
  end
  
  def send_activation_confirmation!
    reset_perishable_token!
    Notifier.activation_confirmation(self).deliver
  end
  
  def email_address_with_name
    "#{self.name} <#{self.email}>"
  end
end
