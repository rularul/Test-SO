class IntroPage
  include PageObject

  page_url("https://app.es.sageone.com/login")
  text_field(:txt_email, :id => 'sso_Email')
  text_field(:txt_password, :id => 'sso_Password')
  button(:btn_login, :css => 'input.button.primary')

  def login(email, password)
    self.txt_email=email
    self.txt_password=password
    btn_login_element.click
  end

end
