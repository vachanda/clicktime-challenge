## The Pirate Shop
This sample web application simulates the functionalities of adding products to the cart and promotion engine. The [link](https://www.clicktime.com/ctc/devintern.html) with a detailed description of the problem statement.

The web application implements the following functions:
* CRUD operations on the cart.
* Automatic promotion application.
* Promotion priority in the evaluation.

### Implementation Details
* ##### Platform Details:
    * Ruby - 2.5
    * Rails - 5.0.7
    * Sqlite3
* ##### Design Details:
    * Implements backend using Ruby-on-Rails with full MVC architecture backed by sqlite3 database.
    * Implements frontend using twitter bootstrap framework and overrides for custom desgin.
    * Service layer pattern is implemented to keep the controllers light.
    * List of Models:
        * **Order** - Represents attributes and functions of an order with the CRUD operations.
        * **LineItem** - Represents the individual component of the order.
        * **Product** - Represents the attributes used for describing an individual product.
        * **Promotion** - Represents the attributes used to describe a promotion (code, expiry_date, usage_limit, etc).
        * **Promotion Actions** - Represents the different kinds of actions that can be performed for a promotion (flat-rate, flat-percent, etc) at order level and at item level.
        * **Promotion Rules** - Represents the set of rules that check for the eligibility of a promotion (item count, line item category,etc).
        * **Adjustment** - Captures the of discount at an item-level or order-level and the associated promotion details.
    * List of APIs:
        * **POST /api/line_items** - Add items to the cart.
        * **PUT /api/line_items/<id>** - Updates the items in the cart.
        * **DELETE /api/line_items/<id>** - Deletes the particular item.

### Assumptions
* The web-app creates one order per session and updates the same order on subsequent add to carts. To create a new order, please use the incognito window to access the application and close when you want to destroy the session.
* The Promotion by will be applicable if all the promotion rules are eligible.
* Item-discount or Order-discount are tracked with the help of adjustments and each adjustment maintains the eligibility using `eligible` attribute.

### Running the code
* ##### Running on Docker
    * Build the docker image for the web-app, by going to the apps directory and running `docker build -t clicktime`
    * Run the docker container - `docker run -d --name clicktime -p 0.0.0.0:3000:3000 clicktime:latest`
    * Now the web application should be available from the browser using the address - `http://localhost:3000/`

> Note: Please use this [link](https://docs.docker.com/install/) to install docker depending on the existing platform.

* ##### Running directly on the host
    * Make sure to install ruby 2.5 on host.
    * Install the bundler - `gem install bundler -v 1.14.0`
    * Install the dependent gems - `bundle install`
    * Run the DB migrations - `rake db:migrate`
    * Setup the initial data - `rake db:setup`
    * Compile the assets - `rake assets:precompile`
    * Run the server - `bundle exec rails s`

> Note:  The above steps to run the web-app were tested on a Linux based platform.

### Test Cases
> Note: The test suite structure is created in the spec folder. To see existing test cases run - `rspec spec/`

### Author
Name: Vachan Daffedar Aswathanarayana
Email: vaas4627@colorado.edu