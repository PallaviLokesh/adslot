assert = require 'assert'
test = require 'selenium-webdriver/testing'
webdriver = require 'selenium-webdriver'


test.describe 'Adslot website', ->

  # Browser (or driver) instance
  browser = null

  # Init browser before we begin
  test.before -> browser = new webdriver.Builder().usingServer().withCapabilities({browserName: 'chrome'}).build()

  # Close browser after all tests
  test.after -> browser.quit()


  test.it 'should have 8 offices on careers page', ->

    browser.get 'http://adslot.com/careers'

    browser.findElements(webdriver.By.css('.ui-tabs-nav h4, .ui-tabs-nav h2')).then (menuItems) ->
      assert menuItems.length, 8


  test.it 'should contain a form on "contact us" page', ->

    browser.get 'http://www.adslot.com/contact-us'

    browser.findElement(webdriver.By.id('first_name')).isDisplayed()
    browser.findElement(webdriver.By.id('last_name')).isDisplayed()
    browser.findElement(webdriver.By.id('message')).isDisplayed()
    browser.findElement(webdriver.By.css('button[type=submit]')).isDisplayed()
    
    # Extended from Pallavi Lokesh
    # Excerise 1 in Selenium
    browser.findElement(webdriver.By.id('company')).isDisplayed()
    browser.findElement(webdriver.By.id('email')).isDisplayed()
    browser.findElement(webdriver.By.id('website')).isDisplayed()
    browser.findElement(webdriver.By.id('OON90000004oGQH')).isDisplayed()
    
    
    browser.findElement(webdriver.By.id('first_name')).isEnabled()
    browser.findElement(webdriver.By.id('last_name')).isEnabled()
    browser.findElement(webdriver.By.id('description')).isEnabled()
    browser.findElement(webdriver.By.css('button[type=submit]')).isEnabled()
    browser.findElement(webdriver.By.id('company')).isEnabled()
    browser.findElement(webdriver.By.id('email')).isEnabled()
    browser.findElement(webdriver.By.id('website')).isEnabled()
    browser.findElement(webdriver.By.id('OON90000004oGQH')).isEnabled()
    
    browser.findElement(webdriver.By.id('OON90000004oGQH')).isSelected()
    
    # to get and print all the options from the dropdown Region
    
    Select dropDown = new Select(driver.findElement(By.id("OON90000004oGQH"))); 
    List <WebElement> elementCount = dropDown.getOptions(); 
    int itemSize = elementCount.size(); 
    for(int i = 0; i < itemSize ; i++)
        { String optionsValue = elementCount.get(i).getText(); 
          System.out.println(optionsValue); 
        }
        
    # Excerise 2 in Selenium 
    # Adslot from google.com
    browser.get 'http://www.google.com.au'
    browser.findElement(webdriver.By.id('lst-ib')).sendkeys("adslot");
    browser.findElement(webdriver.By.id('lst-ib')).sendkeys(Keys.ENTER);
    browser.findElement(webdriver.By.css('.r>a')).click();
    System.out.println(driver.getTitle());
    
    
    #Excersie 3
    #Verifying the Social links and making sure they navigate to the correct url
    browser.get 'http://www.adslot.com/'
    
    browser.findElement(webdriver.By.id('menu-item-148')).isEnabled()
    browser.findElement(webdriver.By.id('menu-item-34')).isEnabled()
    browser.findElement(webdriver.By.id('menu-item-149')).isEnabled()
    
    browser.findElement(webdriver.By.id('menu-item-148')).click()
    String urltwitter = driver.getCurrentUrl();
    System.out.println(urltwitter);
    
    #the new window is loaded - and verify the url is as expected
    browser.findElement(webdriver.By.id('menu-item-34')).click()
    String urlfacebook = driver.getCurrentUrl();
    System.out.println(urlfacebook);
        
    #the new window is loaded - and verify the url is as expected
    browser.findElement(webdriver.By.id('menu-item-149')).click() 
    String urllinkedin = driver.getCurrentUrl();
    System.out.println(urllinkedin);
   
    
    
   
    
