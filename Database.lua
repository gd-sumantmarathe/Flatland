local database_table = {}

-- Tables
database_table.Character = {}
database_table.Map = {}

playerStartingPosX = (love.graphics.getWidth() / 2)
playerStartingPosY = (love.graphics.getHeight() / 2)
playerStartingAngle = 270
playerStaringLength = 30
playerStartingBreadth = 30
playerStartingTranslationalSpeed = 5
playerStartingRotationalSpeed = 5


function database_table.Character:CreateNew (charType, shapeType)

   charTable = charTable or {}
   charTable.__index = self

   charTable.charType = charType
   charTable.shapeType = shapeType

   charTable.maxHealth = 100
   charTable.health = 100
   charTable.attack = 10
   charTable.defense = 10
   charTable.agility = 10

   if charTable.charType == "PC" then
     charTable.posX = playerStartingPosX
     charTable.posY = playerStartingPosY
     charTable.angle = playerStartingAngle

     charTable.translationalSpeed = playerStartingTranslationalSpeed
     charTable.rotationalSpeed = playerStartingRotationalSpeed


     if charTable.shapeType == "rectangle" then
       charTable.length = playerStaringLength
       charTable.breadth = playerStartingBreadth
     end

   end

   return charTable

end


function database_table.Map:CreateNew (mapName, mapLength, mapBreadth)
    mapTable = mapTable or {}

    mapTable.mapName = mapName
    mapTable.mapLength = mapLength
    mapTable.mapBreadth = mapBreadth



end





return database_table
