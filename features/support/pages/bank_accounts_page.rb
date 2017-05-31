class BankAccountsPage
  include PageObject
  include Colorize

  element(:btn_multiaction, :css => 'div.UIMultiActionButton')
  element(:link_newaccount, :css => 'a.UILink.new')
  text_field(:txt_current_page, :id =>'current_page')
  span(:span_total_pages, :css =>'span.total')
  span(:span_total_records, :css =>'span.records')
  text_field(:txt_account_name, :id => 'bank_account_account_name')
  element(:el_account_type, :id => 'bank_account_account_type_id')
  element(:el_cuenta_corriente, :css => 'option[value="1"]')
  text_field(:txt_account_number, :id => 'bank_account_account_number')
  text_field(:txt_account_iban, :id => 'bank_account_iban')
  text_field(:txt_account_bic, :id => 'bank_account_bic')
  button(:btn_save, :xpath => '//div[3]/div/span/button')
  element(:el_validation_summary, :css => 'span.validation-summary')
  cell(:cl_new_name, :xpath => '//tr[2]/td[2]')
  cell(:cl_new_type, :xpath => '//tr[2]/td[3]')
  cell(:cl_new_number, :xpath => '//tr[2]/td[4]')

  $failed = "New bank account is not visible on the grid"
  $passed = "New bank account has been added correctly to grid"


  def recordsNum
    $befRecords = span_total_records
    $pages = span_total_pages
    self.txt_current_page = $pages
    span_total_pages_element.send_keys :enter
  end

  def newAccount
    btn_multiaction_element.hover
    link_newaccount_element.click
  end

  def wrongAccountData(wrongAccountName, accountNumber1)
    self.txt_account_name = wrongAccountName
    el_account_type_element.click
    el_cuenta_corriente_element.click
    el_account_type_element.click
    self.txt_account_number = accountNumber1
    btn_save_element.click
  end

  def checkError
    el_validation_summary_element.check_visible
  end

  def validAccountData(validAccountName, accountNumber2)
    self.txt_account_name = validAccountName
    self.txt_account_number = accountNumber2
    btn_save_element.click
    sleep 3
  end

  def checkNewAccount
    $aftRecords = span_total_records
    if $befRecords == $aftRecords
      abort "Account was not created"
    end
  end

  def checkNewData
    newName = cl_new_name
    newType = cl_new_type
    newNumber = cl_new_number
    checkName = newName.to_s
    checkType = newType.to_s
    checkNumber = newNumber.to_s
    puts newName
    puts newType
    puts newNumber
    if checkName == "Bank Account Test" && checkType == "Cuenta Corriente" && checkNumber == "1111-1111-30-1111111111"
      puts $passed.green
    else
      abort $failed.red
    end
  end

end
