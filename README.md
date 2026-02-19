# Class
A simple lua class manager. Made for big projects.

### Extending a class
```lua
local Object = class:extend()
```
### Templates
Templates represent the data structure of class objects.
Classes are uninstantiable if no template is defined.
```lua
function Object:template(x, y, z)
  self.position = vector(x, y, z)
  self.orientation = quaterion(1, 0, 0, 0)
end
```

### Extended templates
If a class inherits from another, templates can be wrote like this:
```lua
local Sword = Object:extend()

function Sword:template()
  Object.template(self)
  self.damage = 25
  self.durability = 5
end
```

### Instantiating
```lua
local object = Object:new(1, 3, 5)
```

### Merged classes
Merged classes are classes that inherit from multiple other classes.
```lua
local Car = class.merge(Engine, Wheels)
```
```lua
local Car = Engine:merge(Wheels)
```
```lua
local Car = Wheels:merge(Engine)
```
If class A and class B share field X, the new merged class obtains
field X of class B, if it is the last passed class in the method.
