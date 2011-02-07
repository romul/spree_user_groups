User.class_eval do
  belongs_to :user_group
  attr_accessible :email, :password, :password_confirmation, :remember_me, :persistence_token, 
                  :user_group_id
end
