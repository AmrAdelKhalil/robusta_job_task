# robusta_job_task

Instructions to run the application:

1- clone the repo
2- rake db:setup
3- rake db:migrate
4- rake db:seed
5- rails s

How to begin:

1- for admin use "http://localhost:3000/admin", There will be a admin with email 'admin@example.com' and password 'password'

2- for regular user use "http://localhost:3000/"


gem used:

1- activeadmin
2- devise
3- bootstrap-sass

Notices:

1- It could be some missed logic function like 'remove movie from watchlist' but i didn't do it because of the deadline.

2- I left APP_ID and SECRET_ID of my app on facebook for now but after two days i will reset the SECRET_KEY, I left it so that you can use the application, Otherwise it should be put in ENV and bashrc.
