# PostIT
A Ruby on Rails website developer coding practical

## Running the project
This project utilizes the latest versions of Docker and Docker Compose. Please make sure your system is at least somewhat up to date with the most recent version of both.

### Starting the containers
The first time you clone down and run the project will require a little bit of initialization work. You will need to build the web server and database images as well a create the development and test databases within the database container. These actions only need to be completed the first time the project is run and can be skipped for all subsequent restarts of the web and database containers.  
**Building from scratch:**
- `docker-compose build`
- `docker-compose up`

In order to create the development and test database you will need to open a new terminal window and run either:  

- `docker-compose run web rake db:create`  
- `docker-compose run web rake db:migrate`  
or  
- `docker exec -it web-server bash`
- `rake db:create && rake db:migrate`

At this point you should be able to view the project at `localhost:3000`. Simply login/register and start creating new posts.

**Subsequent restarts:**
- `docker-compose up`

## Running the test
Testing is composed of RSpec tests with coverage visible via SimpleCov.  

Call `docker-compose run web rspec` to run the tests and then open up `coverage/index.html` in your browser to view the coverage results

## Running the linters
Linting of this project is composed of a set of 5 linters run in sequence: Rails Best Practices, RuboCop, Reek, Flog, Flay.  
To run all of the linters simply call `docker-compose run web ./lint`

## Future improvements
- Use more complex composer to run selenium and add feature tests that require JS
- Allow nested comments

# Original Specifications
## Ruby on Rails Code Project
As part of our consideration for new hires to our Ruby on Rails dev teams, we ask that you
complete the following project to the best of your ability. Please try to complete the project within
two days.
Project Specs - Make a barebones messaging board
1. Users can register and then must be authenticated before logging in (we use Devise).
Users should have an email (used for logging in), and a first and last name at a minimum.
You can add things like a description or “about me” if you’d like.
2. Users can create posts (title, body, author (user_id), etc)
3. Users can comment on other users’ posts (Comments have post_id, body, author
(user_id))
4. There is a posts index page that lists all posts (for entire site). This is the ‘homepage’.
This should display a list of posts with the title and the author’s name
5. Order posts with most recent posts at the top of the page
6. There is a post show page, that shows a single post. Underneath the post are all the
comments, ordered by date created (oldest at the top)
7. When commenting on a post, you have freedom as far as the layout goes, you can just
have a little box that opens, and the user types in their comment. You can also use a
modal, etc, whatever you want. It makes more sense to have the form for adding a
comment be close to where the comment will end up.
### Project Requirements
- Upload finished project to github
- Use latest version of Rails 4
- Use ruby 2.2 or newer (we use 2.3 on our main project)
- Rspec unit tests minimum of 10
- One feature test (rspec/capybara)
- If not specified, use whatever gem(s) get the job done
Bonus features (not required, but nice to have)
- Style using Bootstrap 3
- Add a modal for creating a new post
- Add a modal for logging in
- Paginate posts#index and/or posts#show (comments)
