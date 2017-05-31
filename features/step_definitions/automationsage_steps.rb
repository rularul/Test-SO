Given(/^an user logins with "([^"]*)" and "([^"]*)" on the Sage One page$/) do |email,password|
  visit IntroPage
  on(IntroPage) do |page|
    page.login(email, password)
  end
end

When(/^user wants register new bank account with "([^"]*)" and "([^"]*)"$/) do |wrongAccountName, accountNumber1|
  on(HomePage) do |page|
    page.link_bankaccounts_element.click
  end

  sleep 5 #sometimes website loads slowly

  on(BankAccountsPage) do |page|
    page.recordsNum
    page.newAccount
    page.wrongAccountData(wrongAccountName, accountNumber1)
  end
end

When(/^data validation is failing when saving$/) do
  on(BankAccountsPage) do |page|
    page.checkError
  end
end

When(/^user adds new data "([^"]*)" and "([^"]*)"$/) do |validAccountName, accountNumber1|
  on(BankAccountsPage) do |page|
    page.validAccountData(validAccountName, accountNumber1)
  end
end

Then(/^user should see new account data on grid$/) do
  on(BankAccountsPage) do |page|
    page.checkNewAccount
    page.checkNewData
  end
end
