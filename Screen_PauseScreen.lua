local screen_table = {}


screen_table.contents =
{
    length = 500,
    breadth = 500,
    name = "screen_pause",
    selectedOption = 0,
    type = "menu",

    options =
    {
        [0] = {["name"] = "Continue", ["posX"] = 250, ["posY"] = 100, ["mode"] = "selected"},
        [1] = {["name"] = "Load Game",  ["posX"] = 250, ["posY"] = 210, ["mode"] = "disabledAndNotSelected"},
        [2] = {["name"] = "Options",    ["posX"] = 250, ["posY"] = 320, ["mode"] = "notSelected"},
        [3] = {["name"] = "Exit",       ["posX"] = 250, ["posY"] = 430, ["mode"] = "notSelected"}
    }

}




return screen_table
