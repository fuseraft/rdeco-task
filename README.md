# Rdeco::Task

**Rdeco::Task** is a RubyGem that provides a metaprogramming module for task execution in a specified order. It allows you to define a set of methods (tasks) in a class and execute them in a specific sequence: **before**, **main**, and **after**.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem "rdeco-task"
```

And then execute:

```bash
$ bundle install
```

Or install it directly using:

```bash
$ gem install rdeco-task
```

## Usage

### Basic Example

To use the `Rdeco::Task` module in your class, follow these steps:

```ruby
require "rdeco/task"

class YourClass
  include Rdeco::Task

  before :setup, :preparation
  main :core_logic
  after :teardown

  def setup
    puts "Setting up..."
  end

  def preparation
    puts "Doing some preparation..."
  end

  def core_logic
    puts "Executing core logic..."
  end

  def teardown
    puts "Tearing down..."
  end
end

# Create an instance of the class
instance = YourClass.new

# Running the tasks in order: before, main, after
YourClass.run(instance)
```

The above code will produce the following output:

```
Setting up...
Doing some preparation...
Executing core logic...
Tearing down...
```

### Decorate Multiple Methods in One Line

You can decorate multiple methods in one line.

```ruby
class AnotherClass
  include Rdeco::Task

  before :setup, :preparation, :setup_other
  main :core_logic
  after :teardown, :cleanup

  # ... (rest of the class definition)
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [fuseraft/rdeco-task](https://github.com/fuseraft/rdeco-task). 

This project is intended to be a safe, welcoming space for collaboration and contributors.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).