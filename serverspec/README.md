## Serverspec

If you want to test the server setup, you can use serverspec.


### Installation:

Go to serverspec/ directory and add this line to your application's Gemfile:

```ruby
gem 'serverspec'
```

And then execute:
---------------
```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install serverspec
```

Getting Started:
---------------
```bash
$ serverspec-init
```

Select a backend type:
---------------
```bash
  1) SSH
  2) Exec (local)

Select number: 1
```

Run it:
---------------
```bash
$ rake spec
```
