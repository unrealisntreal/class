# Class
A simple lua class manager.

### Getting started
```lua
-- Classes are initiated like this:
local Object = class:extend()
```
```lua
-- They must have a template method to be instantiated.
function Object:template()
  self.weight = 10
  self.size = 1
end
```
```lua
-- To actually create a class object, do the following.
local object = Object:new()
```

### Child classes
```lua
-- You can create subclasses by using the same method.
local Sword = Object:extend()
```
```lua
-- To inherit the superclass' object fields, you can define the template like this:
function Sword:template()
  Object.template(self)
  self.damage = 25
  self.level = 2
end
```

### Merged classes
```lua
-- Merged classes are classes that inherit from multiple other classes.
local Car = class.merge(Engine, Wheels)
```
```lua
-- Merging class A with class B may give different results than merging class B with class A.
-- If class A and B have identical keys with different values,
-- the merged class will obtain class B's values.
local Car = Engine:merge(Wheels) or Wheels:merge(Engine)

-- You can define the template for such objects however you want, choosing what
-- works best for your project.
```
