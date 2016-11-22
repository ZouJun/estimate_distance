# EstimateDistance

If you want to simply calculate the distance between the two addresses, you can use the gem to complete your work.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'estimate_distance'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install estimate_distance

## Usage(version 0.0.1)

Before you get the distance between two points, you must pass the detailed address of two points as a parameter.

For example: EstimateDistance.direct_calculate_distance(former_address,latter_address)

Then,you can get the distance between two points

## Update(version 0.0.2)
Version one, the gem is used only 6000 times a day. In order to enhance the number of use。

Version two, the user can go to the Baidu Developer Center to apply for their own ak key, and then use the corresponding gem method to complete your work。

As with version one, you can choose to pass in ak or not.

For example: EstimateDistance.direct_calculate_distance(former_address,latter_address)
OR EstimateDistance.direct_calculate_distance(former_address,latter_address,your_ak)

Then,you can get the distance between two points

## Contributing

1. Fork it ( https://github.com/[my-github-username]/estimate_distance/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
