# Cruby

To get started:
 
```
bin/setup
```

Then compile the C code:

```
bin/rake compile
```

## Usage

From a console:

```
$ bin/console
``` 

Call the various C and Ruby methods like this:

```cassandraql
irb(main):001:0> c = Cruby::c
=> #<Cruby::C:0x00007fed710f44c8 @optimized=false>
irb(main):002:0> ruby = Cruby::ruby
=> #<Cruby::Ruby:0x00007fed7206f218>
irb(main):003:0> ruby.add
Iterations:   100,000,000
Milliseconds: 3604.469
=> nil
irb(main):004:0> c.add
Iterations:   1,000,000,000
Milliseconds: 1439.3609999999999
=> nil
irb(main):005:0> c.optimize
=> true
irb(main):006:0> c.add
Iterations:   1,000,000,000
Milliseconds: 0.013
=> nil
irb(main):007:0> 

```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
