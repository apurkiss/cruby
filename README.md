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


```
$ bin/console
``` 

Or to compile and launch the console:

```
$ ./start
``` 

### Call the various C and Ruby methods

First create c and ruby objects with the `Cruby::c` and `Cruby::ruby` helpers:
```cassandraql
irb(main):001:0> c = Cruby::c
=> #<Cruby::C:0x00007fed710f44c8 @optimized=false>
irb(main):002:0> ruby = Cruby::ruby
=> #<Cruby::Ruby:0x00007fed7206f218>
```
This makes subsequent calls shorter and allows you to set the `optimize` flag on c objects. 
Next call the add method on either object: 

```cassandraql
irb(main):003:0> ruby.add
Iterations:   100,000,000
Milliseconds: 3604.469
=> nil
irb(main):004:0> c.add
Iterations:   1,000,000,000
Milliseconds: 1439.3609999999999
=> nil
```
The default iterations for ruby is 100 million and the default for c is 1 billion, 
but you can change this by passing in a value:  
 
```cassandraql
irb(main):003:0> c.add 10000000000
Iterations:   10,000,000,000
Milliseconds: 13459.671
=> nil
```
Next set the `optimize` flag on c:
```cassandraql
irb(main):005:0> c.optimize
=> true
```
And call `c.add` again
```cassandraql
irb(main):007:0> c.add 10000000000
Iterations:   10,000,000,000
Milliseconds: 0.005
=> nil
```
Here the C compiler gives us a huge boost to performance. 
Since all we're doing in `add` is counting to `x` in a loop, the compiler decides what the final
count will be ahead of time and bypasses the loop. 

The unoptimized version is actually the same code except that the counter `i` is declared as `volatile`.
This tells the compiler to assume nothing about `i` and therefore forces the looping. Typically 
volatile vars are used for global access where interrupts or other threads can change their
value outside of the code in question. 

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
