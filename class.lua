local class = {}
local metatable = {__index = class}

function class:template(...)
  error("Cannot instantiate class.", 2)
end

function class:new(...)

  local instance = {}
  self.template(instance, ...)
  return setmetatable(instance, self)

end

function class:extend()

  local newclass = {}

  for k, v in pairs(self) do
    newclass[k] = v
  end
  newclass.__index = newclass

  return setmetatable(newclass, metatable)

end

function class.merge(...)

  local classes = {...}
  local newclass = {}

  for i = 1, #classes do

    local current = classes[i]
    for k, v in pairs(current) do
      newclass[k] = v
    end

  end

  newclass.template = nil
  newclass.__index = newclass

  return setmetatable(newclass, metatable)

end

return setmetatable({}, metatable)
