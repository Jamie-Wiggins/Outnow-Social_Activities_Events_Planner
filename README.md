# README

## OutNow Vision
To combat loneliness amongst adults by making the process of finding friends and taking part in activities simple and easy, 
helping users achieve a happier and more fulfilling social life.

# Scope
* In Scope:
  * A Map Box API to display custom activity pins on a map which users can view and join activities from.
  * Anonymous real-time group chat for every user involved in a singular activity, helping to limit pre-selection bias.
  * Activities recommendation algorithm using data from the Twitter API and data collection of the user’s interaction with the website to provide a personalised experience for the user.
  *Any form of payments for activities, by the host 
or split between the users attending an activity.

* Out of Scope:
  * Further social media API’s such as Facebook, and Twitch which could be used for further data collection about the user.
  * Live location tracking when attending an activity to improve upon safety of attending activities.
  *Invite a friend via a time-constrained share link for improved safety.

## Tech Stack
* Ruby version 2.6.5
* Ruby on rails version 6.0.2.2
* SaSS version 6.0
* JavaScript
* JQuery
* Bulma (CSS framework) version 0.8
* Postgres version 10.1
* Cloudinary

## API's
* MapBox GL JS API
* Twitter API
* Stripe API

<img width="502" alt="image" src="https://user-images.githubusercontent.com/58704773/181642547-6e1c3d06-ca5a-4657-a56c-17a2420e22e0.png">


See GEM file in repository for all required gems and their versions.

## Setup and Running
* Install the required tech at the specified version.
* Download or pull the repo to local device
* Open a terminal in the repository location and run 'bundle install'
* Create the database, setup steps can be found here: https://guides.rubyonrails.org/v2.3/getting_started.html
* Then run 'rails s' command in the console to start the local server 

## Testing
Test cases included in the repo - 100% pass rate when last run.
Test are included for the entire application including front and back end. Running 'rails test' in the command line will run the test. For more details on running tests see the following guide: https://guides.rubyonrails.org/testing.html
