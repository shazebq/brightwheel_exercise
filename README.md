# README

Instructions:

* Ruby version: 2.6.6
* Rails version: 6.0.3  

This is a Ruby on Rails application and in order to run, you should have Ruby and Rails installed. Then, `cd` into the root direction and run ``rails server``

Once the local server is running you can then use Curl, Postman, or a similar tool make a POST request to this endpoint: ``http://localhost:3000/email``

Ensure that the content-type header is set to application/json and pass parameters like the following:

```
{
   "to": "shazebq@gmail.com",
   "to_name": "Shazeb Qadir",
   "from": "info@brightwheel.com",
   "from_name": "Brightwheel",
   "subject": "A Message from Brighwheel",
   "body": "Hi Shazeb, this is just a test!"
   }
```

Note that mailgun requires that the recipient must be added as an authorized recipient so only the email in the example params will work for now because I added it my account's list of authorized recipients.