# Fetch Scale Automation
This is a coding exercise for Fetch, written in ruby, utilizing chromedriver. It identifies the false bar in a group of nine bars, given all of the bars are identical in weight except for the false bar, which is lighter than the rest, and you have one set of scales to weigh things with.

## Installing Dependencies
- If you're on windows, you'll need to install Ruby, which can be found [here](https://rubyinstaller.org/downloads/).
- Install the Selenium gem with `gem install selenium-webdriver`. Windows users may need to install the ffi gem with `gem install ffi`.
- Download and install the Chrome browser, which can be found [here](https://www.google.com/chrome/). The selenium script should be reasonably version agnostic, but if you run into any issues, it was developed in Chrome version 89. 
- Download chromedriver for your version of Chrome [here](https://sites.google.com/a/chromium.org/chromedriver/downloads), and add its location to your PATH.

## Running the Selenium script
Clone this repo, navigate to local folder containing it in console/terminal, and run the file with `ruby weighing_game.rb`. The page containing the weighing game will launch, the automation will run, and the number of weighings, a list of the weighings, the alert message text, and the identity of the false bar will all be output in the console/terminal.
