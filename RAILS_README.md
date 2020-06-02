# **`Workflow for Creating Rails Applications`**

* Create the basic skeleton of the application.

* Create a database on the PostgreSQL server to hold your data.

* Configure the application to know where your database is located and the login credentials for it.

* Create Rails Active Records (Models).

* Generate Migrations that simplify the creating and maintaining of database tables and columns.

* Write Controller Code to put a life in your application.

* Create Views to present your data through User Interface.

## `Creating an Empty Rails Web Application`

```rb
rails new <app_name>
```

This will create a subdirectory for the application containing a complete directory tree of folders and files for an empty Rails application.

Most of our development work will be creating and editing files in the `library/app` subdirectories.

* The **controllers subdirectory** is where Rails looks to find controller classes. A controller handles a web request from the user.

* The **views subdirectory** holds the display templates to fill in with data from our application.

* The **models subdirectory** holds the classes that model and wrap the data stored in our application's database.

* The **helpers subdirectory** holds any helper classes used to assist the model, view, and controller classes.

### **Starting Web Server**

```rb
rails server
```

## `Create Rails Active Records (Models)`

Rails Active Record is the Object/Relational Mapping (ORM) layer supplied with Rails.

* tables map to classes,
* rows map to objects and
* columns map to object attributes.

Each Active Record object has `CRUD` (Create, Read, Update, and Delete) methods for database access.

```rb
rails generate model Book
rails generate model Subject
```

When you use the generate tool, Rails creates the `actual model file` that holds all the methods unique to the model and the business rules you define, a `unit test file` for performing test-driven development, a `sample data file` (called fixtures) to use with the unit tests, and a `Rails migration` that makes creating database tables and columns easy.

Apart from creating many other files and directories, this will create files named **book.rb** and **subject.rb** containing a skeleton definition in the `app/models` directory.

Content available in **book.rb**

```rb
class Book < ActiveRecord::Base
end
```

Content available in **subject.rb**

```rb
class Subject < ActiveRecord::Base
end
```

#### `Creating Associations between Models`

**Active Record** supports three types of associations

* **`one-to-one`**

* **`one-to-many`**

* **`many-to-many`**

Indicate these associations by adding declarations to your models: `has_one`, `has_many`, `belongs_to` and `has_and_belongs_to_many`.

To do so, modify book.rb and subject.rb to look like this:

```rb
class Book < ActiveRecord::Base
   belongs_to :subject
end
```

Use **`singular`** because one `Book` can belong to a single `Subject`.

```rb
class Subject < ActiveRecord::Base
   has_many :books
end
```

Use **`plural`** because one subject can have multiple books.

#### Implementing Validations on Models

The data you are entering into the database is defined in the actual Rails model.

The validations are:

* value of title field should not be NULL.
* value of price field should be numeric.

Open book.rb in the app\model subdiractory and put the following validations:

```rb
class Book < ActiveRecord::Base
   belongs_to :subject
   validates_presence_of :title
   validates_numericality_of :price, :message=>"Error Message"
end
```

`validates_presence_of` − protects "NOT NULL" fields against missing user input.

`validates_numericality_of` − prevents the user, entering non numeric data.

Besides the validations mentioned above, there are other common [validations](https://guides.rubyonrails.org/active_record_validations.html).

## `Generate Migrations`

Rails Migration allows you to use Ruby to define changes to your database schema.

If one person makes a schema change, the other developers just need to update, and run `rake migrate`.

**What Can Rails Migration Do?**
  * create_table(name, options)

  * drop_table(name)

  * rename_table(old_name, new_name)

  * add_column(table_name, column_name, type, options)

  * rename_column(table_name, column_name, new_column_name)

  * change_column(table_name, column_name, type, options)

  * remove_column(table_name, column_name)

  * add_index(table_name, column_name, index_type)

  * remove_index(table_name, column_name)

**Migrations support all the basic data types:**

  * string − for small data types such as a title.

  * text − for longer pieces of textual data, such as the description.

  * integer − for whole numbers.

  * float − for decimals.

  * datetime and timestamp − store the date and time into a column.

  * date and time − store either the date only or time only.

  * binary − for storing data such as images, audio, or movies.

  * Boolean − for storing true or false values.

**Valid column options are:**
  * limit ( :limit => “50” )

  * default (:default => “blah” )

  * null (:null => false implies NOT NULL)

Here is the generic syntax for creating a migration:

```rb
rails generate migration table_name
```

This will create the file `db/migrate/001_table_name.rb`.

Books migration should be as follows:

```rb
rails generate migration books
```

subject migration should be as follows:

```rb
rails generate migration subjects
```

Notice that you are using **lower case** for book and subject and **plural form** while creating migrations.

#### `Edit the Code`

Go to db/migrate subdirectory of your application.

Modify `001_books.rb` as follows:

```rb
class Books < ActiveRecord::Migration

   def self.up
      create_table :books do |t|
         t.column :title, :string, :limit => 32, :null => false
         t.column :price, :float
         t.column :subject_id, :integer
         t.column :description, :text
         t.column :created_at, :timestamp
      end
   end

   def self.down
      drop_table :books
   end
end
```

The method `self.up` is used when migrating to a new version, `self.down` is used to roll back any changes if needed.

#### `Run the Migration`

Now that you have created all the required migration files.

```rb
rake db:migrate
```

Each new migration will be a new version, and any new migrations will be run until your database is at the current version.

#### `Running Migrations for Production and Test Databases`

If you would like to specify what Rails environment to use for the migration, use the `RAILS_ENV` shell variable.

```rb
export RAILS_ENV = production
rake db:migrate

export RAILS_ENV = test
rake db:migrate

export RAILS_ENV = development
rake db:migrate
```
**NOTE** − In Windows, use `set RAILS_ENV = production` instead of **export** command.

## `Controllers`

It coordinates the interaction between the user, the views, and the model.

```rb
rails generate controller Book
```

Notice that you are **capitalizing** Book and using the **singular** form.

It creates a file called `app/controllers/book_controller.rb`:

```rb
class BookController < ApplicationController
end
```

Controller classes inherit from `ApplicationController`, which is the other file in the controllers folder: **application.rb**.

The `ApplicationController` contains code that can be run in all your controllers and it inherits from Rails `ActionController::Base` class.

**Note** that it is upto you what name you want to give to these methods, but better to give relevant names.

```rb
class BookController < ApplicationController
   def list
   end

   def show
   end

   def new
   end

   def create
   end

   def edit
   end

   def update
   end

   def delete
   end

end
```

#### `Implementing the list Method`

The `list` method gives you a list of all the books in the database.

```rb
def list
   @books = Book.all
end
```

#### `Implementing the show Method`

The `show` method displays only further details on a single book.

```rb
def show
   @book = Book.find(params[:id])
end
```

When you're on the page called by the `list` method, you can click a link for a specific book, and it passes the `id` of that book via the params object so that `show` can find the specific book.

#### `Implementing the new Method`

The `new` method lets Rails know that you will create a new object.

```rb
def new
   @book = Book.new
   @subjects = Subject.all
end
```

The above method will be called when you will display a page to the user to take user input.

#### `Implementing the create Method`

Once you take user input using HTML form, it is time to create a record into the database.

```rb
def create
   @book = Book.new(book_params)

   if @book.save
      redirect_to :action => 'list'
   else
      @subjects = Subject.all
      render :action => 'new'
   end

end

def book_params
   params.require(:books).permit(:title, :price, :subject_id, :description)
end
```

The first line creates a new instance variable called `@book` that holds a **Book** object built from the data, the user submitted.

The `book_params` method is used to collect all the fields from object `:books`.

The data was passed from the `new` method to create using the **params object**.

The next line is a conditional statement that redirects the user to the `list` method if the object saves correctly to the database.

If it doesn't save, the user is sent back to the `new` method.

Then `@subjects = Subject.all` is required in case it does not save data successfully and it becomes similar case as with `new` option.

#### `Implementing the edit Method`

The `edit` method looks nearly identical to the `show` method.

Both methods are used to retrieve a single object based on its `id` and display it on a page.

```rb
def edit
   @book = Book.find(params[:id])
   @subjects = Subject.all
end
```

This method will be called to display data on the screen to be modified by the user.

#### `Implementing the update Method`

This method will be called after the `edit` method, when the user modifies a data and wants to update the changes into the database.

The `update` method is similar to the `create` method and will be used to update existing books in the database.

```rb
def update
   @book = Book.find(params[:id])

   if @book.update_attributes(book_param)
      redirect_to :action => 'show', :id => @book
   else
      @subjects = Subject.all
      render :action => 'edit'
   end
end

def book_param
   params.require(:book).permit(:title, :price, :subject_id, :description)
end
```

The `update_attributes` method is similar to the `save` method used by create but instead of creating a new row in the database, it overwrites the attributes of the existing row.

Then `@subjects = Subject.all` line is required in case it does not save the data successfully, then it becomes similar to `edit` option.

#### `Implementing the delete Method`

```rb
def delete
   Book.find(params[:id]).destroy
   redirect_to :action => 'list'
end
```

#### `Additional Methods to Display Subjects`

Assume you want to give a facility to your users to browse all the books based on a given subject.

```rb
def show_subjects
   @subject = Subject.find(params[:id])
end
```
Finally your book_controller.rb file will look as follows:

```rb
class BooksController < ApplicationController

   def list
      @books = Book.all
   end

   def show
      @book = Book.find(params[:id])
   end

   def new
      @book = Book.new
      @subjects = Subject.all
   end

   def book_params
      params.require(:books).permit(:title, :price, :subject_id, :description)
   end

   def create
      @book = Book.new(book_params)

      if @book.save
         redirect_to :action => 'list'
      else
         @subjects = Subject.all
         render :action => 'new'
      end
   end

   def edit
      @book = Book.find(params[:id])
      @subjects = Subject.all
   end

   def book_param
      params.require(:book).permit(:title, :price, :subject_id, :description)
   end

   def update
      @book = Book.find(params[:id])

      if @book.update_attributes(book_param)
         redirect_to :action => 'show', :id => @book
      else
         @subjects = Subject.all
         render :action => 'edit'
      end
   end

   def delete
      Book.find(params[:id]).destroy
      redirect_to :action => 'list'
   end

   def show_subjects
      @subject = Subject.find(params[:id])
   end

end
```

### **`Routes`**

Routes are drawing a map for your requests.

The map tells them where to go based on some predefined pattern:

```rb
Rails.application.routes.draw do
   Pattern 1 tells some request to go to one place
   Pattern 2 tell them to go to another
   ...
end
```

Example:

```rb
Rails.application.routes.draw do
   get 'book/list'
   get 'book/new'
   post 'book/create'
   patch 'book/update'
   get 'book/list'
   get 'book/show'
   get 'book/edit'
   get 'book/delete'
   get 'book/update'
   get 'book/show_subjects'
end
```

The `routes.rb` file defines the actions available in the applications and the type of action such as `get`, `post`, and `patch`.

Use the following command to list all your defined routes or for giving you a good overview of the URLs in an application you're trying to get familiar with.

```rb
rake routes
```

## `Views`

Each method you define in the **`controller`** needs to have a corresponding **`erb file`**, with the `same name as the method`.

#### `Creating View File for list Method`

Create a file called `list.html.erb` and save it to `app/views/book`.

```rb
<% if @books.blank? %>
<p>There are not any books currently in the system.</p>
<% else %>
<p>These are the current books in our system</p>

<ul id = "books">
   <% @books.each do |c| %>
   <li><%= link_to c.title, {:action => 'show', :id => c.id} -%></li>
   <% end %>
</ul>

<% end %>
<p><%= link_to "Add new Book", {:action => 'new' }%></p>
```

The code to be executed is to check whether the `@books` array has any objects in it.

The `.blank?` method returns `true` if the array is empty, and `false` if it contains any objects.

The code between the `<%= %>` tags is a `link_to` method call.

The first parameter of `link_to` is the text to be displayed between the `<a>` tags.

The second parameter is what action is called when the link is clicked - `show` method.

The final parameter is the `id` of the book that is passed via the params object.

#### `Creating View File for new Method`

Create a file called `new.html.erb` and save it to `app/views/book`.

```rb
<h1>Add new book</h1>

<%= form_tag :action => 'create' do %>
<p><label for = "book_title">Title</label>:

<%= text_field 'books', 'title' %></p>
<p><label for = "book_price">Price</label>:

<%= text_field 'books', 'price' %></p>
<p><label for = "book_subject_id">Subject</label>:

<%= collection_select(:books, :subject_id, @subjects, :id, :name, prompt: true) %></p>
<p><label for = "book_description">Description</label><br/>

<%= text_area 'books', 'description' %></p>
<%= submit_tag "Create" %>

<% end -%>
<%= link_to 'Back', {:action => 'list'} %>
```

Here `form_tag` method interprets the Ruby code into a regular HTML `<form>` tag using all the information supplied to it. This tag, for example, outputs the following HTML:

```
<form action = "/book/create" method = "post">
```

Next method is `text_field` that outputs an `<input>` text field. The parameters for `text_field` are object and field name. In this case, the **object** is `book` and the **name** is `title`.

Rails method called `collection_select`, creates an HTML `select menu` built from an array, such as the @books one. There are five parameters, which are as follows −

  * `:book` − The object you are manipulating. In this case, it's a `book` object.

  * `:subject_id` − The field that is populated when the `book` is saved.

  * `@books` − The array you are working with.

  * `:id` − The value that is stored in the database. In terms of HTML, this is the `<option>` tag's value parameter.

  * `:name` − The output that the user sees in the pull-down menu. This is the value between the `<option>` tags.

The next used is `submit_tag`, which outputs an `<input>` button that submits the form.

Finally, there is the `end` method that simply translates into `</form>`.

When you click the `Create` button, it will call the `create` method.

#### `Creating View File for show Method`

Create a `show.html.erb` file under `app/views/book`:

```rb
<h1><%= @book.title %></h1>

<p>
   <strong>Price: </strong> $<%= @book.price %><br />
   <strong>Subject :</strong> <%= @book.subject.name %><br />
   <strong>Created Date:</strong> <%= @book.created_at %><br />
</p>

<p><%= @book.description %></p>

<hr />

<%= link_to 'Back', {:action => 'list'} %>
```

This is the first time you have taken the full advantage of associations, which enable you to easily pull data from related objects.

The format used is**` @variable.relatedObject.column`**.

In this instance, you can pull the subject's name value through the `@book` variable using the `belongs_to` associations.

#### `Creating View File for edit Method`

Create a new file called `edit.html.erb` and save it in `app/views/book`:

```rb
<h1>Edit Book Detail</h1>

<%= form_for @book, :url =>{:action => "update", :id =>@book} do |f| %>

<p>Title: <%= f.text_field 'title' %></p>
<p>Price: <%= f.text_field  'price' %></p>
<p>Subject: <%= f.collection_select :subject_id, Subject.all, :id, :name %></p>
<p>Description<br/>

<%= f.text_area 'description' %></p>
<%= f.submit "Save changes" %>
<% end %>

<%= link_to 'Back', {:action => 'list' } %>
```

In this scenario, we used `form_for` tag for the form action.

It will perform better than `form_tag`, because it will create interaction with the **Model** easily.

Therefore it is better to use `form_for` tag whenever you need interaction between the **model** and the **form fields**.

At this point, we need some modification in the `list method`'s view file.

```rb
<li>
   <%= link_to c.title, {:action => "show", :id => c.id} -%>
   <b> <%= link_to 'Edit', {:action => "edit",
   :id => c.id} %></b>
</li>
```

Now, you edit this information and then click the `Save Changes` button.

This will result in a call to `update` method available in the controller file and it will update all the changed attribute.

Notice that the `update` method does not need any view file because it's using either `show` or `edit` methods to show its results.

#### `Creating View File for delete Method`

You do not need to write any **view code** for the `delete` method because this method is using `list` method to display the result.

Modify `list.html.erb` again and add a `delete` link.

```rb
<li>
   <%= link_to c.title, {:action => 'show', :id => c.id} -%>
   <b> <%= link_to 'Edit', {:action => 'edit', :id => c.id} %></b>
   <b> <%= link_to "Delete", {:action => 'delete', :id => c.id},
      :confirm => "Are you sure you want to delete this item?" %></b>
</li>
```

The `:confirm` parameter presents a JavaScript confirmation box asking if you really want to perform the action. If the user clicks OK, the action proceeds, and the item is deleted.

#### `Creating View File for show_subjects Method`

Create a new file, `show_subjects.html.erb`, in the `app/views/book` directory:

```rb
<h1><%= @subject.name -%></h1>

<ul>
   <% @subject.books.each do |c| %>
   <li><%= link_to c.title, :action => "show", :id => c.id -%></li>
   <% end %>
</ul>
```

Now modify the Subject: line of `show.html.erb` so that the subject listing shows a link.

```rb
<strong>Subject: </strong> <%= link_to @book.subject.name,
:action => "show_subjects", :id => @book.subject.id %><br />
```

This will output a list of subject on the index page, so that users can access them directly.

Modify `list.html.erb` to add the following to the top of the file:

```rb
<ul id = "subjects">
   <% Subject.find(:all).each do |c| %>
   <li><%= link_to c.name, :action => "show_subjects", :id => c.id %></li>
   <% end %>
</ul>
```

## `Layouts`

The process involves defining a `layout template` and then letting the controller know that it exists and to use it.

Add a new file called `standard.html.erb` to `app/views/layouts`.

You let the controllers know what template to use by the name of the file.

Add the following code to the new `standard.html.erb` file and save your changes:

```rb
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns = "http://www.w3.org/1999/xhtml">

   <head>
      <meta http-equiv = "Content-Type" content = "text/html; charset = iso-8859-1" />
      <meta http-equiv = "Content-Language" content = "en-us" />
      <title>Library Info System</title>
      <%= stylesheet_link_tag "style" %>
   </head>

   <body id = "library">
      <div id = "container">

         <div id = "header">
            <h1>Library Info System</h1>
            <h3>Library powered by Ruby on Rails</h3>
         </div>

         <div id = "content">
            <%= yield -%>
         </div>

         <div id = "sidebar"></div>

      </div>
   </body>

</html>
```

The `stylesheet_link_tag` helper method outputs a stylesheet `<link>`. In this instance, we are linking `style.css` style sheet.

The `yield` command lets Rails know that it should put the `html.erb` for the method called here.

Now open `book_controller.rb` and add the following line just below the first line:

```rb
class BookController < ApplicationController
layout 'standard'
def list
@books = Book.all
end
...................
```

It instructs the controller that we want to use a layout available in the `standard.html.erb` file.

## `Adding Style Sheet`

Till now, we have not created any style sheet, so Rails is using the `default style sheet`.

Now let's create a new file called` style.css` and save it in `/public/stylesheets`.

```cs
body {
   font-family: Helvetica, Geneva, Arial, sans-serif;
   font-size: small;
   font-color: #000;
   background-color: #fff;
}

a:link, a:active, a:visited {
   color: #CD0000;
}

input {
   margin-bottom: 5px;
}

p {
   line-height: 150%;
}

div#container {
   width: 760px;
   margin: 0 auto;
}

div#header {
   text-align: center;
   padding-bottom: 15px;
}

div#content {
   float: left;
   width: 450px;
   padding: 10px;
}

div#content h3 {
   margin-top: 15px;
}

ul#books {
   list-style-type: none;
}

ul#books li {
   line-height: 140%;
}

div#sidebar {
   width: 200px;
   margin-left: 480px;
}

ul#subjects {
   width: 700px;
   text-align: center;
   padding: 5px;
   background-color: #ececec;
   border: 1px solid #ccc;
   margin-bottom: 20px;
}

ul#subjects li {
   display: inline;
   padding-left: 5px;
}
```

## `Send Emails`

`Action Mailer` is the Rails component that enables applications to send and receive emails.


#### `Action Mailer - Configuration`

Go to the `config` folder of your project and open `environment.rb` file and add the following line at the bottom of this file.

```rb
config.action_mailer.delivery_method = :smtp
```

It tells `ActionMailer` that you want to use the SMTP server.

You can also set it to be `:sendmail` if you are using a Unix-based operating system such as Mac OS X or Linux.

Add the following lines of code at the bottom of your environment.rb as well.

```rb
config.action_mailer.smtp_settings = {
   address:              'smtp.gmail.com',
   port:                 587,
   domain:               'example.com',
   user_name:            '<username>',
   password:             '<password>',
   authentication:       'plain',
   enable_starttls_auto: true  
}
```

Replace each hash value with proper settings for your Simple Mail Transfer Protocol (SMTP) server.

You don't need to change `port number 25` and `authentication type` if you are using a standard SMTP server.

If you prefer to send email in HTML instead of plain text format, add the following line to `config/environment.rb` as well:

```rb
ActionMailer::Base.default_content_type = "text/html"
```

`ActionMailer::Base.default_content_type` could be set to "text/plain", "text/html", and "text/enriched".

The next step will be to create a mailer.

#### `Generate a Mailer`

Use the following command to generate a mailer as follows −

```rb
tp> cd emails
emails> rails generate mailer Usermailer
```

This will create a file `user_mailer.rb` in the `app\mailer` directory.

```rb
class Emailer < ActionMailer::Base
end
```

Let's create one method as follows:

```rb
class UserMailer < ApplicationMailer
   default from: 'notifications@example.com'

   def welcome_email(user)
      @user = user
      @url  = 'http://www.gmail.com'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
   end

end
```

  * **default Hash** − This is a hash of default values for any email you send from this mailer. In this case we are setting the `:from header` to a value for all messages in this class.

  * **mail** − The actual email message, we are passing the `:to` and `:subject` headers in.

Create a file called `welcome_email.html.erb` in `app/views/user_mailer/`.

```html
<html>

   <head>
      <meta content = 'text/html; charset = UTF-8' http-equiv = 'Content-Type' />
   </head>

   <body>
      <h1>Welcome to example.com, <%= @user.name %></h1>

      <p>
         You have successfully signed up to example.com,your username is:
         <%= @user.login %>.<br>
      </p>

      <p>
         To login to the site, just follow this link:
         <%= @url %>.
      </p>

      <p>Thanks for joining and have a great day!</p>

   </body>
</html>
```

Next we will create a text part for this application as follow:

```t
Welcome to example.com, <%= @user.name %>
===============================================

You have successfully signed up to example.com,
your username is: <%= @user.login %>.

To login to the site, just follow this link: <%= @url %>.

Thanks for joining and have a great day!
```

#### `Calling the Mailer`

First, let's create a simple `User scaffold`

```
$ bin/rails generate scaffold user name email login
$ bin/rake db:migrate
```

`Action Mailer` is nicely integrated with `Active Job` so you can send emails outside of the request-response cycle, so the user doesn't have to wait on it:

```rb
class UsersController < ApplicationController
   # POST /users
   # POST /users.json
   def create
   @user = User.new(params[:user])

      respond_to do |format|
         if @user.save
            # Tell the UserMailer to send a welcome email after save
            UserMailer.welcome_email(@user).deliver_later

            format.html { redirect_to(@user, notice: 'User was successfully created.') }
            format.json { render json: @user, status: :created, location: @user }
         else
            format.html { render action: 'new' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
         end

      end

   end
end
```

Now, test your application by using http://127.0.0.1:3000/users/new.

This will send your message and will display the text message "Message sent successfully" and output as follow:

```t
sent mail to kittuprasad700@gmail.com (2023.Sms)
[ActiveJob] [ActionMailler::DeliveryJob] [2cfde3c-260e-4a33-1a6ada13a9b] Date: Thu, 09 Jul 2015 11:44:05 +0530
From: notification@example.com
To: kittuprasad700@gmail.com
Message-Id: <559e112d63c57_f1031e7f23467@kiranPro.mail>
Subject: Welcome to My Awesome Site
Mime-Version: 1.0
Content-Type: multipart/alternative;
boundary="--mimepart_559e112d601c8_f1031e7f20233f5";
charset=UTF-8
Content-Transfer-Encoding:7bit
```
