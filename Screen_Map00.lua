local screen_table = {}


screen_table.contents =
{
    length = 1000,
    breadth = 1000,
    name = "screen_map_00",
    type = "map",

    playerSpawnPosX = 100,
    playerSpawnPosY = 100,
    playerSpawnAngle = 90,

    charactersOnMap =
    {
        totalCharacters = 0,

        character =
        {

        }

    }


}


function screen_table.GetCharacters()
    return charactersDatabase
end


function screen_table.AddCharacter(character)
    screen_table.contents.charactersOnMap.character[screen_table.contents.charactersOnMap.totalCharacters] = character
    screen_table.contents.charactersOnMap.totalCharacters = screen_table.contents.charactersOnMap.totalCharacters + 1
end


return screen_table
