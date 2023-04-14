# team8-lab6

## Abstract
For this project, our group creating a functioning presentation evaluation tool. Students can evaluate and grade other presentations, and teachers can create presentations, assign students to them, and grade the presentations.

## Table of Contents
* Overview
    * Features
    * Possible Improvements
    * Controller Contributions
* Installation
* Running Lab 6
* Testing

## Overview

### Features
- The first feature is the login page. Only valid username/password combinations will allow access to the site, and the account logged into will affect permisions within the site. 
- After a successful login, users will be brought to the presentation page. Here, a list of all the presentations are shown. A user signed in as a teacher will also see a link to create a new presentation.
- Clicking a presentation name will bring you to its page. Here, students not in that group will be able to leave feedback and a score. Students in that group will be able to see other students feedback and score as well as the final score from the teacher (but cannot evaluate themselves). Teachers on that page will be able to see the team members, and the feedback and score left by students, assign a final score, and add team members. Upon clicking the create a new presentation link, a teacher is able to create a new presentation for the presentations page.
- Using the nav bar, instructors can navigate to the users page. Only priveleged users (instructors) can access the users page. Here, a class roster shows user's names, emails, if they are still in the class, and their id. There is also the functionality to add students/instructors to the class, changing enrollment. Instructors can also edit students/instructors' information.
- There is no functionality to delete users because of how that would affect presentations and feedback. Rather, to keep a record of students past and present, students are removed from the class by editing their account from active to inactive. Inactive users cannot login.

### Possible Improvements
We could add a notification system, maybe by email or in website alerts, to remind students to leave feedback and scores on other presentations. This alert system is similar to how Charlie alerts us to fill out our CatMe serveys, and is a useful addition to our tool. We can also make an exclusive navbar for the teachers.

### Controller Contributions
- Carter Scheatzle worked on the users controller, the application controller, and sessions controller.
- Kevin Penroese worked on the presentations controller. 
- Lohith Maralla also worked on the presentations controller.
- Matthew Zhou worked on the sessions controller, the presentations controller, and the application controller.

## Installation

The `Gemfile` and `Gemfile.lock` files contain all the dependencies needed to run this program. To install them, run:

```bash
$ bundle install
```

This program also depends on a database, so run the following to create a database with initial data:

```bash
$ rails db:migrate
$ rails db:seed
```
## Running Lab 6
After the above installation steps, run:
```bash
$ rails server
```
Then type http://localhost:3000/ into your machines google chrome, which should bring you to the login page.
Login with:

Username: giles.25@osu.edu
Password: 123
For privileged access

Username: doe.1@osu.edu
Password: 123
For basic student access

## Testing
Thorough testing can be found in the test folder, where the controllers are tested. Redirects are tested, as are the post and gets. To test, run

```bash
$ rails test
```

## Styling
Our team used Rubocop to style Ruby code.# SurveyWebsite
