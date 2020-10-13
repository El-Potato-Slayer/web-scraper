
# Ruby: Web Scraper
> This is a web scraper built to scrape the products from [SweetCity](https://www/sweetcity.co.za). A menu is displayed in which the user has to select one of the four different product categories. After a category is selected, a list of all the products in the selected category will be displayed, and the user will be given an option to export the list to a CSV file. 

## Built With

- Ruby

## Features
- Has a menu system
- Allows user to scrap products from all the different categories
- Exports the data to CSV

## Getting Started

### To get a local copy of the repository please run the following commands on your terminal:
#### With Bundler:
    1. git clone https://github.com/El-Potato-Slayer/web-scraper.git
    2. cd into cloned directory by running 'cd web-scraper'
    3. run 'bundle install'
    4. run 'ruby bin/main.rb'

#### With Individual Gems
    1. git clone https://github.com/El-Potato-Slayer/web-scraper.git
    2. cd into cloned directory by running 'cd web-scraper'
    3. run 'gem install rubocop'
    4. run 'gem install nokogiri'
    5. run 'gem install rspec'
    6. run 'gem install tty-progressbar'
    7. run 'gem install tty-prompt'
    8. run 'ruby bin/main.rb'
    

## Usage
While inside the main directory, run:

    ruby bin/main.rb
    
You will be presented with a menu of the four main product categories. Using your arrow keys, select one of the available options and press Enter.

    > Sweet & Gum
      Chocolates
      Snacks & Drinks
      Gifts & Novelties
     
Once selected, the scraper might take a moment to fetch the data. This will be indicated by the progress-bar.

    [██████████████████           ] 67%
    
A list of all the products within the selected category will be displayed

    1. Name: 20-Flavor Jelly Bean Gift Box 240g
       Price: R175.00
       
    2. Name: Airheads Extreme Sour 57g
       Price: R35.00
    ...
    
Afterwards, you will be asked if you would like to have a CSV file of the products generated. Using your arrow keys, select an option and press Enter.

    Would you like to save the list to a csv file?
    > Yes
      No
      
If you select no, the program will end. If you select yes, you will be asked to give the file a name.

    Please enter the name of the file (files with the same name will be overwritten):
    FileName
    
You will then be notified that the file was successfully created

    FileName.csv was successfully created
    
Afterwards, you will be thanked for using the program and the program will end

    Thank you for you using my program :-)
    
### Testing
In order to run the tests for the program, run 'rspec' while in the main directory. All the tests will then proceed to execute.

## Authors

👤 **Chad-Leigh Van Wyk**

- Github:[@El-Potato-Slayer](https://github.com/El-Potato-Slayer)
- Twitter:[@elpotatoslayer](https://twitter.com/elpotatoslayer)
- LinkedIn:[@Chad Van Wyk](https://www.linkedin.com/in/chad-van-wyk-4228b21a6/?originalSubdomain=za)


## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.
