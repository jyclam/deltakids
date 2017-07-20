# DeltaKids
DeltaKids is a responsive website built over a weekend as part of a hackathon style challenege.

## Built on
* rails 5.1.1
* cancancan 1.17.0, for authorization
* smarter_csv 1.1.4, for parsing existing client data
* faker 1.8.0, for generating dummy data
##### For styling:
* bootstrap-sass 3.3.7
* bootstrap_form 2.7.0
* simple_calendar 2.2.5

## Installation
`bundle`

`rails db:create db:migrate db:seed`

## Features
* Organization sign up, log in.
* Resources creation, deletion.
* Services creation, update, deletion.
* Program creation, update, deletion.
* Automatic activities creation based on Program parameters.
* Filtering of Services, Programs, Resources, and Activities.
* Administrator dashboard for reviewing and approving Programs, Services, and Resources.
