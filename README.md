# Test-SO
About thecnical test

Automated test with homemade framework. It was created by our mates and me at last job. It uses ruby, cucumber, gherkin and, as text editor, we choose Atom.
Code can be reviewed in this same repository. 

Result returned by terminal is: 


Feature: Create a new bank account
  As a website user
  In order to save new bank account with data validation fail
  I need to change data and save correct one

  Scenario Outline: General search                                                             # features/features/automationsage.feature:6
  # steps (dont included, only edited to easier view)
    Given an user logins with "<email>" and "<password>" on the Sage One page                  # features/features/automationsage.feature:7
    When user wants register new bank account with "<wrongAccountName>" and "<accountNumber1>" # features/features/automationsage.feature:8
    And data validation is failing when saving                                                 # features/features/automationsage.feature:9
    And user adds new data "<validAccountName>" and "<accountNumber2>"                         # features/features/automationsage.feature:10
    Then user should see new account data on grid                                              # features/features/automationsage.feature:11

Examples: 
      | email                      | password       | wrongAccountName | accountNumber1          | validAccountName  | accountNumber2          |
      |New bank account has been added correctly to grid 
 automatic.test@yopmail.com | automatic.test |                  | 1111 1111 40 1111111111 | Bank Account Test | 1111 1111 30 1111111111 |

1 scenario (1 passed)
5 steps (5 passed)
0m33.742s
