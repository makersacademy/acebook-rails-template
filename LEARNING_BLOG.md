# Livewire's Learnings

This blog documents what we've learnt and achieved each day.

## Day 1

## Day 3 - Anna's Rake notes:

**Resources:**

[rake documentation](https://www.stuartellis.name/articles/rake/)

[good guide to rake](https://dev.to/vinistock/customizing-rails-rake-tasks-3bg5) 

[rake best pracices](https://edelpero.svbtle.com/everything-you-always-wanted-to-know-about-writing-good-rake-tasks-but-were-afraid-to-ask)

[recent guide to rake](https://www.rubyguides.com/2019/02/ruby-rake/)

**generate a new rake task:**

`$ rails g task my_namespace` - creates a new .rake file in lib/tasks

**sample rake file:**

```
namespace :test
	desc "One line task description"
	task :name_of_task do
	  # Your code goes here
	end
end
```

**sample task that depends on other tasks:**

```
namespace :main do
  task :test do
    if true
      puts "Calling test2 task."
      Rake::Task["main:test2"].invoke #invokes main:test2
    else
      abort()
    end
  end

  task :test2 do
      puts ">Test2 task invoked"
  end
end
```

**sample task with parameters:**

```
desc "Example of task with parameters and prerequisites"
task :my_task, [:first_arg, :second_arg] => ["first_task", "second_task"] do |t, args|
  args.with_defaults(:first_arg => "Foo", :last_arg => "Bar")
  puts "First argument was: #{args.first_arg}"
  puts "Second argument was: #{args.second_arg}"
end
```

**example rake task that imports data from a csv:**

```
namespace :import do
	desc "imports data from csv file"
	task :data => :environment do
		require 'csv'
		CSV.foreach('path/to/products.csv') do |row|
			name = row[0]
			price = row[1].to_i
			Product.create(name: name, price: price)
		end
	end
end
```

**add tasks to Travis.yml:**

in scripts, add:

`bundle exec rake namespace_name:task_name`

**add tasks to Procfile for Heroku to execute:**

`worker: bundle exec rake my:rake_task`

(used with release: because our app is running on a single dyno so the web process might block any worker processes)