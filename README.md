# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to follow:

* Ruby version: **2.7.1**

* Rails version: **6.0.3**

* System dependencies
  * move to project dir
  * install rails, bundler
  **run** `bundle install`

* Database creation
  * **Creation** `rake db:create`
  * **Migration** `rake db:migrate`
  * **Seed** `rake db:seed`

* How to run the test suite
  * **run** `rake db:create RAILS_ENV=test`
  * **run** `rspec`

* Run App:
  * after setup **run** `rails server`
  * open localhost:3000 to see courses list
  * open links Course List and Tutors List to perform CURD

* API details:
  **Create course**
  Method: POST
  URL: localhost:3000/api/v1/courses
  Request Body:

  ```
    {
    "course": {
      "name": "BCCA",
      "credits": 100,
      "months_duration": 6,
      "tutors_attributes": [
        {
          "first_name": "akash",
          "last_name": "sharma",
          "email": "akash@gmail.com",
          "mobile": "8723643672",
          "doj": "01/08/2021"
        }
      ]
    }
  }
  ```

  **Get courses**
  Method: GET
  URL: localhost:3000/api/v1/courses
  Response Body:

  ```
    {
    "data": [
      {
        "id": 1,
        "credits": "100.0",
        "months_duration": 36,
        "created_at": "2021-11-19T16:04:45.777Z",
        "updated_at": "2021-11-19T16:04:45.777Z",
        "course_name": "BCA",
        "course_id": 1,
        "first_name": "Alex",
        "last_name": "william",
        "email": "alex@gmail.com",
        "mobile": "+911234567890",
        "doj": "2021-11-19"
      },
      {
        "id": 2,
        "credits": "100.0",
        "months_duration": 36,
        "created_at": "2021-11-19T16:04:45.784Z",
        "updated_at": "2021-11-19T16:04:45.784Z",
        "course_name": "BCA",
        "course_id": 1,
        "first_name": "John",
        "last_name": "cena",
        "email": "john@gmail.com",
        "mobile": "+911234567899",
        "doj": "2021-11-19"
      },
      {
        "id": 3,
        "credits": "200.0",
        "months_duration": 24,
        "created_at": "2021-11-19T16:04:45.798Z",
        "updated_at": "2021-11-19T16:04:45.798Z",
        "course_name": "MCA",
        "course_id": 2,
        "first_name": "Jonny",
        "last_name": "cruise",
        "email": "jonny@gmail.com",
        "mobile": "+911234567811",
        "doj": "2021-11-19"
      },
      {
        "id": 4,
        "credits": "200.0",
        "months_duration": 24,
        "created_at": "2021-11-19T16:04:45.806Z",
        "updated_at": "2021-11-19T16:04:45.806Z",
        "course_name": "MCA",
        "course_id": 2,
        "first_name": "Andrew",
        "last_name": "faris",
        "email": "andrew@gmail.com",
        "mobile": "+911234567812",
        "doj": "2021-11-19"
      },
      {
        "id": null,
        "credits": "100.0",
        "months_duration": 36,
        "created_at": null,
        "updated_at": null,
        "course_name": "BBA",
        "course_id": null,
        "first_name": null,
        "last_name": null,
        "email": null,
        "mobile": null,
        "doj": null
      },
      {
        "id": null,
        "credits": "200.0",
        "months_duration": 36,
        "created_at": null,
        "updated_at": null,
        "course_name": "MBA",
        "course_id": null,
        "first_name": null,
        "last_name": null,
        "email": null,
        "mobile": null,
        "doj": null
      }
    ],
    "status": "ok"
  }
  ```
