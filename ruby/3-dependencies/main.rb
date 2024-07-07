# require "./dependency.rb"
require_relative  "dependency"
# Use require_relative here over require
## Since script is called in root dir
### https://stackoverflow.com/questions/9750610/ruby-require-error-cannot-load-such-file


# Imports are made possible by an explicit require statement
## No import affix required
## Use relative filepath syntax to locate file if not using a module

puts(exportedMethod(1,2,3))

x = Example.new(1)
x.name = "hello"
puts(x.name)
puts(x.getObjectIdOne)
puts(x.getName)