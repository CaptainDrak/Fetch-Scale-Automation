require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome
driver.get 'http://ec2-54-208-152-154.compute-1.amazonaws.com/'

# Outputs false bar (passed argument), weighings, number of weighings, and alert message.
define_method(:report_results) do |falsebar|
    puts "It took #{driver.find_elements(xpath: "//li").length} weighings to find the false bar, and it was bar #{falsebar}.\n\nThe weighings were:"
    puts driver.find_element(xpath: '/html/body/div/div/div[1]/div[5]/ol').text
    driver.find_element(id: "coin_#{falsebar}").click
    puts "\nThe alert message was: '#{driver.switch_to.alert.text}'"
end

# Sends two values from the group of three (passed arguments) we know to contain the false bar, checks the
# results, identifies the false bar, and gathers the list of weighings and alert text.
define_method(:compare_bars) do |bar0, bar1, bar2|
    driver.find_element(xpath: '/html/body/div/div/div[1]/div[4]/button[1]').click
    driver.find_element(id: "left_0").send_keys bar0
    driver.find_element(id: "right_0").send_keys bar1
    driver.find_element(id: "weigh").click
    weighing_result = driver.find_element(xpath: '/html/body/div/div/div[1]/div[2]').text
    if weighing_result[-1] == '='
        report_results(bar2)
    elsif weighing_result[-1] == '<'
        report_results(bar0)
    elsif weighing_result[-1] == '>'
        report_results(bar1)
    end
end

# Places two different group of three bars on each side of the scale.
[0, 1, 2].each do |i| ; driver.find_element(id: "left_#{i}").send_keys i.to_s ; end
[3, 4, 5].each do |i| ; driver.find_element(id: "right_#{i-3}").send_keys i.to_s ; end

# Weighs and compares the groups, determining which group of three contains the false bar.
driver.find_element(id: 'weigh').click
weighing_result = driver.find_element(xpath: '/html/body/div/div/div[1]/div[2]').text
sleep 1

# Runs the method to get the specific false bar on the appropriate group of three bars, and weighings and alert text.
if weighing_result[-1] == '='
    compare_bars('6', '7', '8')
elsif weighing_result[-1] == '<'
    compare_bars('0', '1', '2')
elsif weighing_result[-1] == '>'
    compare_bars('3', '4', '5')
end
sleep 3