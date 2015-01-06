Spree::User.class_eval do
  belongs_to :user_group
  
  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end
end
