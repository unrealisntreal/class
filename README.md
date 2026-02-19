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
If a class inherits from another, templates can be written like this:
```lua
local Sphere = Object:extend()

function Sphere:template()

  Object.template(self)
  self.radius = 5

end
```

### Instantiating
```lua
local sphere = Sphere:new(0, 5, 0)
```

### Merged classes
Merged classes are classes that inherit from multiple other classes.
If class A and class B share field X, the new merged class obtains
field X of class B, if it is the last passed class in the method.
```lua
local Car = Engine:merge(Wheels) or class.merge(Engine, Wheels)
```
