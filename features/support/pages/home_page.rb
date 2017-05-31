class HomePage
  include PageObject

  element(:link_bankaccounts, :xpath => '//header/div/nav/ul/li[4]/a/span')

  def clickAccount
    link_bankaccounts_element.click
  end

end
