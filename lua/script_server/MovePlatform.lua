local MovePlatform = {}

local part = nil

local maxPosition = Vector3.new(0, 12, 0)

local minPosition = Vector3.new(0, 2, 3)

local initialPosition = Vector3.new(0, 5, 0)

local speed = 0.05

local nextPosition = nil

local intervalVector = nil

local timer = nil

local function Move()
  local distance = Vector3.Distance(part.WorldPosition, nextPosition)
  
  if distance < 0.5 then
    local isMinPosition = nextPosition == minPosition
    nextPosition = isMinPosition and maxPosition or minPosition
    
    local direction = nextPosition - part.WorldPosition
    intervalVector = direction.normalized * speed
  else
    part.WorldPosition = part.WorldPosition + intervalVector
  end
  
end

function MovePlatform:start(Map)
  part = Map.Root:FindFirstChild("MovePlatform", true)
  part.WorldPosition = initialPosition
  
  nextPosition = minPosition
  local direction = nextPosition - part.worldPosition
  intervalVector = direction.normalized * speed
  
  timer = Timer.new(1, Move)
  timer.Loop = true
  timer:Start()
  
  end

return MovePlatform