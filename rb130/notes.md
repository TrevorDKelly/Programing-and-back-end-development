Closure
  - a chunk of code
  - binds its surrounding artifacts
      builds an 'enclosure' around them
      allows them to be referenced later when the closure is executed
  - similar to a method that is passed around and executed
      but it is not defined with an explicit name
  - implimented in ruby with `Proc` objects, lambdas, and blocks

Binding
  - the references to surrounding artifacts that a closure maintains

Block
  - code passed into a method invocation deliniated by `do..end` or `{}`
  - passed into methods as arguments
      NOT part of the method implimentation
      the method decides what it does with a block
  - every mehtod takes a block by default
  - variable between the `| |` is the block paramiter
      variable is a Block Local Variable
      scope is contained within the block
  - Allows for flexibility when calling a method
  - Allows us to differ some inplimentation code
      can decide at method invocation time
  - return value is the last expresion in the block

Yielding
  - the `yield` keyword executes the block
  - if `yield` is called in the method definition and no block is passed at invocation, a `LocalJumpError` is raised
      `Kernel#block_given?` method can get past that
  - `yield` is passed arguments like a method call
  - it returns the value returned by the block

Arity
  - rules regarding how many arguments can be passed to a block
  - in ruby num of arguments doesnt have to match num of block paramiters
      def test
        yield(1, 2)
      end

      test { |param| puts param } #=> 1

  - block paramiters are `nil` if nothing is yielded
      def test
        yield(1)
      end

      test { |param1, param2| puts "#{param1}-#{param2} } #=> "1-"

Implimentation
  - the method definition.
  - Decideds if a block is used and how it is used
Invocation
  - calling a method.
  - where the blocks code is written

Sandwich Code
  - when methods have before and after actions
      before action => yield => after action
  - `File::open` method
      opens the file => yields => closes the file

Explicit block passing
  - to give a block a name for reference in the method definition
  - give the method definition a parameter that starts with `&`
      `def method(&block)`
      does not need the `&` to be referenced
  - converts the block into a 'Simple Proc'
  - Allows for the block to be passed into another method as an argument
  - run the block by calling `#call` method
      def method(&block)
        block.call(param1, param2)
      end

&
  - converts an object into a block
  - is expecting a proc object
      array.map(&:to_s)
      - `&` checks if `:to_s` is a proc object
          if not it calls `#to_proc` on the object

-------------
TESTING
-------------

Unit Testing

Minitest
  - default ruby testing library

Testing prevents Regression
  - when adding a new feature, other parts of the program may break
  - testing builds a suite of outcomes we expect from the program
  - These can be tested any time a change is made

Test Suite
  - the entire set of tests that accompanies an application
  - All the tests

Test
  - situation or context where tests are run
  - many things can be tested within one Test

Assertion
  - the verification step
  - confim that some data returned by a program is what is expected
  - many assertions can be made within one Test

Testing Framework
  - software that prvides a way to test each component of an application
  - provide input, check return values, examine output, derterine errors
  - 3 features
      describe the test you want to run
      execute the test
      report results

SEAT Approach
  - Set up objects
    Execute code
    Assert results
    Tear down lingering artifacts
  - setup method is run before all tests
      used to build objects that are going to be tested
  - teardown method is run after every test
      used to break down lingering effects of program - close files ect.

assert_equal vs assert_same
  - assert_equal uses `==`
  - assert_same uses `===`
      are they the same object
  - custom classes need a `==` method defined to use assert equal properly

$stdin
  - Standard Input Stream
  - usually the keyboard
  - Global variable Ruby uses to represent the default input source
  - `str = gets.chomp` is the same as `str = $stdin.gets.chomp`
  - useful for testing
      - def method(input: $stdin)
      we can give an input at invocation rather than waiting on input
StringIO
  - class that simulates input - a "String Stream"
      `input = StringIO.new("abcdefg/n")
          'abcdefg' is typed then return is hit


Project directories
  test code in a `test` directory
  ruby source files in a `lib` directory
  Gemfile

  .gemspec
    `project_name.gemspec`
      ```ruby
      Gem::Specification.new do |s|
        s.name        = 'todolist_project'
        s.version     = '1.0.0'
        s.summary     = 'Todo List Manager!'
        s.description = 'This is a simple todo list manager!'
        s.authors     = ['Pete Williams']
        s.email       = 'pw@example.com'
        s.homepage    = 'http://example.com/todolist_project'
        s.files       = ['lib/todolist_project.rb', 'test/todolist_project_test.rb']
      end
      ```
  Rakefile
    add `require 'bundler/gem_tasks'`
      adds common tasks to the Rakefile
        rake build
          creates a .gem file in the pkg directory
        rake install
          runs rake build then installs it as a gem to your directory
        rake release
          sends the .gem file to Rubygems

