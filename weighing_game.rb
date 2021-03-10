require "selenium-webdriver"
Selenium::WebDriver::Chrome::Service.driver_path = "C:/WebDriver/bin/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome
driver.get 'http://ec2-54-208-152-154.compute-1.amazonaws.com/'

# Outputs false bar, weighings, number of weighings, and alert message.
define_method(:report) do |falsebar|
    puts "It took #{driver.find_elements(xpath: "//li").length} weighings to find the false bar, and it was bar #{falsebar}.\n\nThe weighings were:"
    puts driver.find_element(xpath: '/html/body/div/div/div[1]/div[5]/ol').text
    driver.find_element(id: "coin_#{falsebar}").click
    puts "\nThe alert message was: '#{driver.switch_to.alert.text}'"
end

# Sends two values from the group of three we know to contain the false bar, checks the
# results, identifies the false bar, and gathers the list of weighings and alert text.
define_method(:compare) do |bar0, bar1, bar2|
    driver.find_element(xpath: '/html/body/div/div/div[1]/div[4]/button[1]').click
    driver.find_element(id: "left_0").send_keys bar0
    driver.find_element(id: "right_0").send_keys bar1
    driver.find_element(id: "weigh").click
    result = driver.find_element(xpath: '/html/body/div/div/div[1]/div[2]').text
    if result[-1] == '='
        report(bar2)
    elsif result[-1] == '<'
        report(bar0)
    elsif result[-1] == '>'
        report(bar1)
    end
end

# Places two different group of three bars on each side of the scale.
[0, 1, 2].each do |i| ; driver.find_element(id: "left_#{i}").send_keys i.to_s ; end
[3, 4, 5].each do |i| ; driver.find_element(id: "right_#{i-3}").send_keys i.to_s ; end

# Weighs and compares the groups, determining which group of three contains the false bar.
driver.find_element(id: 'weigh').click
result = driver.find_element(xpath: '/html/body/div/div/div[1]/div[2]').text
sleep 1

# Runs the method to get the specific false bar on the appropriate group of three bars, and weighings and alert text.
if result[-1] == '='
    compare('6', '7', '8')
elsif result[-1] == '<'
    compare('0', '1', '2')
elsif result[-1] == '>'
    compare('3', '4', '5')
end
sleep 3
