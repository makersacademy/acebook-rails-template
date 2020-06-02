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

The `.blank?` method returns `true` if the array is empty, and `false` if it contains any objects. This `@books` object was created in controller inside the list method.

The code between the `<%= %>` tags is a link_to method call.

The first parameter of `link_to` is the text to be displayed between the <a> tags.

The second parameter is what action is called when the link is clicked. In this case, it is the show method.

The final parameter is the id of the book that is passed via the params object.

Now, try refreshing your browser and you should get the following screen because we don't have any book in our library.
