# Start It Up

Welcome to Start It Up, a start-up idea rating and reviewing hub. It is web-ready and responsive for mobile phones and tablets. This project has been implemented by Chris Sandison for CSC309 Individual Project. This runs on Rails 4.1.8 and Ruby 2.2.0. 

### To Run

* Download or clone repository and navigate to `start_up` folder.
* Ensure that bundler is installed. Run `bundle install` to install all needed gems. Run `bundle install --without production` to skip installation of Postgres, which is used in production on heroku.
* Run `rake db:create` to initialize database. SQLite3 is specified in the gemfile for development.
* Run `rake db:migrate` to initailize schema
* Run `rake db:seed` if you would like to pre-fill development db with Users, Ideas, Industries and Likes that have been created for easier development.
* Run `rails s` and navigate to `localhost:3000` (or whatever is specified by your hostfile) to navigate

#### This project is also deployed at [this heroku address](https://fast-cliffs-5271.herokuapp.com/)

## API

As part of the application specification, a public facing API is available for pulling analytics data from the application. No API key or user authentication is required since this is data gathering for analytics purposes only.

**HTTP Request**

Gets the *count* most liked ideas within *start* and *end*

`GET https://fast-cliffs-5271.herokuapp.com/api/v1/ideas`

**Query Parameters**

* `start` - the start day for the most liked ideas, as a UNIX timestamp (default: 1 week ago)
* `end` - the end day for the most liked ideas, as a UNIX timestamp (default: end of current day)
* `count` - number of most-liked ideas to pull (default: 10)


Without parameters, this method will return the top 10 ideas of the week.

** Response **

```javascript
{ 
  "ideas" : [
    {
      "id" : <id number>,
      "created_by" : <username>,
      "title" : <idea title>,
      "description" : <idea description>,
      "likes" : <number of likes this idea has recieved>,
      "dislikes" : <number of dislikes idea has recieved>
    },
    ...
  ]
}
```

**HTTP Request**

Gets a url for a google chart, breaking down the number of ideas by industry. Only pie charts supported for now.

`GET https://fast-cliffs-5271.herokuapp.com/api/v1/ideas_chart`

**Query Parameters**

* none

** Response **

```javascript
{
  "chart_type" : "Pie",
  "chart_url" : <url>
}
```




An example of this api is utilized on the site. After logging in, click on "Analytics" in the site header.