Feature: Search on Youtube
  As a website user
  In order to save new bank account with data validation fail
  I need to change data and save correct one

  Scenario Outline: General search
    Given an user logins with "<email>" and "<password>" on the Sage One page
    When user wants register new bank account with "<wrongAccountName>" and "<accountNumber1>"
      And data validation is failing when saving
      And user adds new data "<validAccountName>" and "<accountNumber2>"
    Then user should see new account data on grid

    Examples:
      | email                      | password       | wrongAccountName | accountNumber1          | validAccountName  | accountNumber2          |
      | automatic.test@yopmail.com | automatic.test |                  | 1111 1111 40 1111111111 | Bank Account Test | 1111 1111 30 1111111111 |
