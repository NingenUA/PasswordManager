class GoogleHomPage < Selenium::WebPage
  def initialize(browser)
    super(browser, 'Google')
  end

  def title
    browser.get_title
  end

  def search_field
    text_field(:name, 'q')
  end

  def search_button
    button(:name, 'btnG')
  end

end

profile = Selenium::WebDriver::Chrome::Profile.new
profile['download.prompt_for_download'] = false
profile['download.default_directory'] = "c:/sites/proekt/"

driver = Selenium::WebDriver.for :chrome, :profile => profile