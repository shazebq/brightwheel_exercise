# README

### Running the application

* Ruby version: 2.6.6
* Rails version: 6.0.3  

This is a Ruby on Rails application and in order to run, you should have Ruby and Rails installed. Then, `cd` into the root directory and run ``rails server``

Note, you must have the master.key file (which I emailed) in the config directory. This is needed in order to access
the Mailgun API key.

Once the local server is running, you can then use Curl, Postman, or any similar tool make a POST request to this endpoint: ``http://localhost:3000/email``

Ensure that the content-type header is set to ```application/json``` and pass parameters such as the following:

```
{
    "to": "brightwheeltest@mailinator.com",
    "to_name": "Shazeb Qadir",
    "from": "info@brightwheel.com",
    "from_name": "Brightwheel",
    "subject": "A Message from Brighwheel",
    "body": "Hi Shazeb, this is just a test!"
}
```

Note that Mailgun requires that the recipient must be added as an authorized recipient so only the email in the example params will work for now because I added it to 
my account's list of authorized recipients. After testing the endpoint, you can go to this public
inbox and see that the email was sent: https://www.mailinator.com/v3/index.jsp?zone=public&query=brightwheeltest#/#inboxpane

### Testing

You can run the rspec tests by opening a terminal, cd-ing into the root directory (brightwheel_exercise) and entering ```rspec```

### Notes

I did not have time to set up Sendgrid because it seemed to be a more involved process and time
was limited.

One thing I would consider doing if this was a production application would be to make the sending of the email
a background job.