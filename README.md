# Fetch Scale Automation
This is a coding exercise for Fetch, written in Ruby, utilizing selenium and chromedriver. It identifies the false bar in a group of nine bars, given all of the bars are identical in weight except for the false bar, which is lighter than the rest, and you have one set of scales to weigh things with.

## Installing Dependencies
- If you're on windows, you'll need to install Ruby, which can be found [here](https://rubyinstaller.org/downloads/). This tool was developed in Ruby 2.7.
- Install the Selenium gem with `gem install selenium-webdriver`. Windows users may need to install the ffi gem with `gem install ffi`.
- Download and install the Chrome browser, which can be found [here](https://www.google.com/chrome/). The selenium script should be reasonably version agnostic, but if you run into any issues, it was developed in Chrome version 89. 
- Download chromedriver for your version of Chrome [here](https://sites.google.com/a/chromium.org/chromedriver/downloads) (chromedriver and Chrome version must match), and add its location to your PATH. For help adding it to your PATH, you can look [here](https://zwbetz.com/download-chromedriver-binary-and-add-to-your-path-for-automated-functional-testing/).

## Running the Selenium script
Clone this repo, navigate to local folder containing it in console/terminal, and run the file with `ruby weighing_game.rb`. The page containing the weighing game will launch, the automation will run, and the number of weighings, a list of the weighings, the alert message text, and the identity of the false bar will all be output in the console/terminal.

## Common Error Resultion
- Your current version of Chrome may need to be forced to update from within the browser settings itself.
- Chromium browser won't work in place of Chrome; if you are running into driver initialization errors and have Chromium browser installed, you'll need to install Chrome proper.
- Linux and Mac will handle Ruby PATH addition automagically pretty well, but the Windows Ruby installer sometimes populates the wrong location to your PATH. If you are having issues running ruby commands on Windows console, make sure what it auto-added to your PATH actually matches the reality of where Ruby is installed on your machine.
