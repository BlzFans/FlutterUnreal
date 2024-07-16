print("===lua main===")

require "utils"
if file_exists(getLuaPath() .. "/ts_main.lua") then
    require("ts_main")
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

runApp(GameView({child = widget}))
