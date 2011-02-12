Feature: Checkout
  In order to buy stuff
  As a user
  I should be able make checkout

  @selenium
  Scenario: Member of the user group should get adjustment to order
    Given a payment method exists
    Given I am signed up in user group "10% off" as "email@person.com/password"
    
    When I go to the sign in page
    And I sign in as "email@person.com/password"
    Then I should be logged in
    
    When I go to the products page
    When I add a product with name: "RoR Mug", price: 25 to cart
    Then I should see "RoR Mug"
    And I should see "Shopping Cart" within "h1"
    When I follow "Checkout"
    Then I should see "User Group"
    And I should see "-$2.5"
    When I fill billing address with correct data
    And check "order_use_billing"
    And press "Save and Continue"
    Then I should see "Shipping Method"
    When I choose "UPS Ground" as shipping method and "Check" as payment method
    Then I should see "Your order has been processed successfully"
    And I should have 1 order

  @selenium
  Scenario: Member of the user group should get adjustment to guest order after log in
    Given a payment method exists
    Given I am signed up in user group "10% off" as "email@person.com/password" 
    
    And I am logged out

    When I add a product with name: "RoR Mug", price: 25 to cart
    Then 2 users should exist

    When I go to the sign in page
    And I sign in as "email@person.com/password"
    Then I should be logged in

    When I follow "Cart"
    Then I should see "RoR Mug"
    And I should see "Shopping Cart" within "h1"
    When I follow "Checkout"
    Then I should see "User Group"
    And I should see "-$2.5"
    When I fill billing address with correct data
    And check "order_use_billing"
    And press "Save and Continue"
    Then I should see "Shipping Method"
    When I choose "UPS Ground" as shipping method and "Check" as payment method
    Then I should see "Your order has been processed successfully"
    And I should have 1 order

