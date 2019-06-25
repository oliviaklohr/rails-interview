# Ledford Interview Instructions

## Project Setup

This project uses React.js as its front-end. To set up, please run

`bundle install`

`yarn`

`bundle exec rake db:setup`

To make sure it's all working,

`rails s`

You should see the dashboard at your `localhost` port, and if you navigate to `localhost:PORT/questions`, you should be hitting the API.

## Testing

Tests can be run with the `rspec` command, and lint can be checked with the `rubocop` command.

## API Token
To use the API token for this project, you'll need to grab a token from the database, and add it to your headers. The header should have the key `Authorization` and the value `Token token="token-value"`. I personally use [ModHeader](https://chrome.google.com/webstore/detail/modheader/idgpnmonknjnojddfkpgkljpfnnfcklj?hl=en) to do this with ease in the browser.

## Filtering
Questions can be filtered using the key `title` and the value that you'd like to filter by.

# Kaleo Rails Engineer Candidate Interview Project

Thanks for taking the time to complete this exercise. We're excited that you're considering joining our amazing team.

This Rails application is a basic skeleton of an app that serves an API about questions and answers. It already includes 4 basic models:

1.  Question
2.  Answer
3.  User
4.  Tenant

A Question can have one or more answers, and can be private. Every Answer belongs to one question. Each Question has an asker (User), and each Answer has a provider (User).

A Tenant is a consumer of the API you are going to write. A db/seeds.rb file is included to preload the database with test data when you setup the DB.

## You need to accomplish the following tasks:

*   Add a RESTful, read-only API to allow consumers to retrieve Questions with Answers as JSON (no need to retrieve Answers on their own). The response should include Answers inside their Question as well as include the id and name of the Question and Answer users.
*   Don't return private Questions in the API response.
*   Require every API request to include a valid Tenant API key, and return an HTTP code of your choice if the request does not include a valid key.
*   Track API request counts per Tenant.
*   Add an HTML dashboard page as the root URL that shows the total number of Users, Questions, and Answers in the system, as well as Tenant API request counts for all Tenants.  Style it enough to not assault a viewer's sensibilities.
*   Add tests around the code you write as you deem appropriate. Assume that the API cannot be changed once it's released and test accordingly.
*   You are welcome to add any models or other code you think you need, as well as any gems.

## Extra credit features you might consider:

*   Allow adding a query parameter to the API request to select only Questions that contain the query term(s).  Return an appropriate HTML status code if no results are found.
*   Add a piece of middleware to throttle API requests on a per-Tenant basis. After the first 100 requests per day, throttle to 1 request per 10 seconds.

## Project Setup

Clone this repo locally, and from the top-level directory run:

`bundle install`

`bundle exec rake db:setup`

To make sure it's all working,

`rails s`

You should see this same information.

## Submitting your project

Send us a zip file of the whole project for us to evaluate it.  If you need to add any additional instructions to the README please put them at the very top of that file and mention.  Expect to discuss your design decisions during the interview.
