
This is readme file for the CSD and UX project.
Please read the instrunction carefully and set-up the environment. 
Ideally one should have Linux/Ubuntu OS to for the better performance and easy to install.
Below are the commands to install Ruby and Rails
Go to your Linux, Ubuntu or Aptana (IDE) Terminal.

  1  sudo apt-get update
  2  sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev
  3  sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
  4  curl -L https://get.rvm.io | bash -s stable
  5  source ~/.rvm/scripts/rvm
  6  rvm install 2.0.0
  7  rvm use 2.0.0 --default

// Install Ruby   
  
  8  ruby -v

// It should be Ideally (Ruby 1.9.3) or latest

  9  sudo add-apt-repository ppa:chris-lea/node.js
 10  sudo apt-get update
 11  sudo apt-get install nodejs
 12  gem install rails 4.1.0
 13  gem install rails --version=4.1.0
 14  rails -v

 // It should be Rails 4.1.0 or latest

//Ruby on Rails set-up is done. Now go to Project folder through terminal (suppose Project folder path is  home/x13104802 )

15   Bundle Install

(It will install all the gem file. If it throws an error, Delet 'Gemfile.lock' file and hit 'bundle install' again)

16  Rails s 
(Start the server)

17  Go to browser and hit "localhost:3000" 

// Thats it we are good to go !!	 
