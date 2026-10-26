# Class ![Lua](https://img.shields.io/badge/lua-5.1%20%7C%20JIT-blue)
A high-performance class manager with annotations.

### Extending a class
```lua
---@class Object: Class
local Object = class:extend()
```
### Templates
Templates represent the data structure of class objects.
Classes are uninstantiable if no template is defined.
```lua
---@param x number
---@param y number
---@param z number
function Object:template(x, y, z)
  self.name = "Object"
  self.position = vector(x, y, z)
end
```

### Extended templates
If a class inherits from another, templates can be written like this:
```lua
---@class Sphere: Object
local Sphere = Object:extend()

function Sphere:template()
  Object.template(self)
  self.name = "Sphere"
  self.radius = 5
end
```

### Merged classes
Merged classes are classes that inherit from multiple other classes.
If class *A* and class *B* share field *X*, the new class obtains field *X* of class *B*, if it is the last passed class.
```lua
---@class Engine: Object
local Engine = Object:extend()
-- ...

---@class Wheels: Object
local Wheels = Object:extend()
-- ...

---@class Car: Engine, Wheels
local Car = class.merge(Engine, Wheels)

function Car:template()
  Object.template(self)
  Engine.template(self)
  Wheels.template(self)
end
```
### Instantiating
```lua
local car = Car:new()
```
