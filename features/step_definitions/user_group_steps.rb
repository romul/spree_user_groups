Given /^I am signed up in user group "(\d+)% off" as "(.+)\/(.+)"$/ do |percent, email, password|
  user_group = Factory(:user_group, :name => "#{percent}% off", :calculator => Calculator::AdvancedFlatPercent.new(:preferred_flat_percent => percent))
  Factory(:user, :email => email, :password => password, :password_confirmation => password, :user_group => user_group)
end
