## Bloccit

## Description
A Reddit clone to learn the fundamentals of web development and Rails 4.

Made with my mentor, [Eliot Sykes](https://www.bloc.io/mentors/eliot-sykes) at [Bloc](http://bloc.io)
This project is hosted at [tienyuan-bloccit](http://tienyuan-bloccit.herokuapp.com/).

## Features
* Public and private Topics and Posts
* Up-voting / down-voting posts
* Favoriting posts
* User ranking page
* Popular posts page

## Setup

Add environment variable information to /config/application.yml
This should consist of SendGrid username, SendGrid password and a Devise secret key. Images are hosted with AWS.

Refer to /config/application.example.yml for an example.

```
DEVISE_SECRET_KEY: 
SENDGRID_USERNAME: 
SENDGRID_PASSWORD: 
AWS_SECRET_KEY_ID: 
AWS_SECRET_ACCESS_KEY: 
AWS_BUCKET:
```
