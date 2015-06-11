# Onfleet

Onfleet is an API wrapper for [Onfleet's APIs](http://docs.onfleet.com).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'onfleet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install onfleet

## Usage

You can create an instance of the API wrapper:

    onfleet = Onfleet::API.new("your_api_key")

You can set `api_key`, `timeout`, `throws_exceptions`, `retry_if_fails` and `logger` globally:

    Onfleet::API.api_key = "your_api_key"
    Onfleet::API.timeout = 15
    Onfleet::API.throws_exceptions = false
    Onfleet::API.retry_if_fails = true
    Onfleet::API.logger = Logger.new("#{Rails.root}/log/onfleet.log")


For example, you could set the values above in an `initializer` file in your `Rails` app (e.g. your\_app/config/initializers/onfleet.rb).

Assuming you've set an `api_key` on Onfleet, you can conveniently make API calls on the class itself:

    Onfleet::API.tasks.all

You can also set the environment variable `ONFLEET_API_KEY` and Onfleet will use it when you create an instance:

    onfleet = Onfleet::API.new


### Fetching Tasks

For example, to fetch all the tasks of your organisation:

    tasks = onfleet.tasks.all

### Fetching Destinations

Similarly, to fetch your destinations:

    lists = onfleet.destinations.all

Or, to fetch a task by id:

    task = onfleet.tasks.find('task_id')

Or, to delete a task by id:

    task = onfleet.tasks.delete('task_id')


Or, to update a task by id:

    task = onfleet.tasks.delete(id: 'task_id', other_updating_params: value)

    passing id to update any resource is necessory

The above examples were for only task resource. Same way it can be used for other resources i.e. organization,
admins, workers, teams, destinations, recipients, tasks, webhooks.

### Setting timeouts

Onfleet defaults to a 30 second timeout. You can optionally set your own timeout (in seconds) like so:

    onfleet = Onfleet::API.new("your_api_key", {:timeout => 5})

or

    onfleet.timeout = 5

### Error handling

By default Onfleet will attempt to raise errors returned by the API automatically.

If you set the `throws_exceptions` boolean attribute to false, for a given instance,
then Onfleet will not raise exceptions. This allows you to handle errors manually. The
APIs will return a Hash with two keys "message", a hash containing two keys 'message' and 'error'.
'message' contains textual information about the error, 'error' the numeric code of the error,
and "code", the name code of the error.

If you rescue Onfleet::OnfleetError, you are provided with the error message itself as well as
a `code` attribute that you can map onto the API's error list. The API docs list possible errors
at the bottom of each page. Here's how you might do that:

    begin
      onfleet.tasks.all
    rescue Onfleet::OnfleetError => e
      # do something with e.message here
      # do something wiht e.code here
    end

## Contributing

1. Fork it ( https://github.com/[my-github-username]/onfleet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
