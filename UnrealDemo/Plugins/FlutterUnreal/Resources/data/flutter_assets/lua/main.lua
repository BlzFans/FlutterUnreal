print("======lua main======")

require "utils"
if file_exists(getLuaPath() .. "/flutter_main.lua") then
    require(flutter_main)
    return
end

local widget = Center {
    child = Text(
        "FlutterUnreal lua example", {
            style = TextStyle {
                fontWeight = FontWeight.bold,
                color = Colors.blue,
            },
            textDirection = TextDirection.ltr,
        }
    )
}

runApp(widget)
