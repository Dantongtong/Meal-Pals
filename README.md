# Meal-Pals

## Ruby version
ruby: 2.6.6  
rails: 4.2.10

## Team members
| Name      | Uni |
| ----------- | ----------- |
| Buyi Cheng      | bc2996       |
| Huili Zheng   | hz2710        |
| Yuren Dong   | yd2620        |
| Dantong Zhu   | dz2451        |


## Usage
```shell
bundle install

rake db:migrate

rake db:seed

rails server
```


Test User:
- admin
  - email: admin@columbia.edu
  - password: 123
- general 
  - email: test@columbia.edu
  - password: 123
  
  
Don't forget to add **SENDGRID_API_KEY, S3_ACCESS_KEY, S3_SECRET_KEY** to `application.yml` under the config directory.
> SENDGRID_API_KEY is the key for sending confirm email in registration progress
> S3_ACCESS_KEY and S3_SECRET_KEY are keys for AWS S3 Bucket access

In browser, open http://localhost:3000
