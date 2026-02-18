# Class
A simple lua class manager.

### Getting started
Classes are initiated like this:
```lua
local Object = class:extend()
```
They must have a template method to be instantiated.
```lua
function Object:template()
  self.weight = 10
  self.size = 1
end
```
To actually create a class object, do the following.
```lua
local object = Object:new()
```

### Child classes
You can create subclasses by using the same `extend` method.
```lua
local Sword = Object:extend()
```
To inherit the superclass' object fields, you can define the template like this:
```lua
function Sword:template()
  Object.template(self)
  self.damage = 25
  self.level = 2
end
```

### Merged classes
Merged classes are classes that inherit from multiple other classes.
```lua
local Car = class.merge(Engine, Wheels)
```
Merging class A with class B may give different results than merging class B with class A.
If class A and B have identical keys with different values, the merged class will obtain class B's values.
```lua
local Car = Engine:merge(Wheels) or Wheels:merge(Engine)
```
You can define the template for such objects however you want, choosing what
works best for your project.
