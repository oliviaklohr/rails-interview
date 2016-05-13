# Kaleo Rails Engineer Candidate Interview Project

Thanks for taking the time to complete this exercise. We're excited that you're considering joining our amazing team.

This Rails application is a basic skeleton of an app that serves an API about questions and answers. It already includes 4 basic models:

1.  Question
2.  Answer
3.  User
4.  Tenant

A Question can have one or more answers, and can be private. Every Answer belongs to one question. Each Question has an asker (User), and each Answer has an answerer (User).

A Tenant is a consumer of the API you are going to write. A db/seeds.rb file is included to preload the database with test data.

## You need to accomplish the following tasks:

*   Add a RESTful, read-only API to allow consumers to retrieve Questions and Answers as JSON. The response should nest Answers inside their Question and include the id and name of the Question asker and Answer answerer.
*   Don't return private Answers in the API response.
*   Require every API request to include a valid Tenant API key, and return an HTTP code of your choice if the request does not include a valid key.
*   Track API request counts per Tenant.
*   Add an HTML dashboard page that shows the total number of Questions and Answers in the system, as well as Tenant API request counts for all Tenants.
*   Add tests around the code you write as appropriate. Assume that the API cannot be changed once it's released and test accordingly.

## Extra credit features you might consider:

*   Allow adding a query parameter to the API request to select only Questions that contain the query term(s).
*   Add a piece of middleware to throttle API requests on a per-Tenant basis. If the Tenant exceeds a rate of 1 request every 2 seconds throttle the response to add a 5 second delay for 30 seconds.

## Setup

`cd ~/your code dir`

`git clone git@github.com:KaleoSoftware/rails-interview-project.git .`

`bundle install`

`bundle exec rake db:setup`

To make sure its all working,

`rails s`

You should see this same information.
