-- AUTHOR: ${_AUTHOR_}
-- EMAIL: ${_EMAIL_}
-- DATE: ${_DATE(%Y-%B-%A)_}
add_rules("mode.debug", "mode.release")
set_languages("c17", "c++17")

target "main"
set_kind "binary"
add_files "src/*.c"

add_includedirs "/opt/homebrew/include"
add_linkdirs "/opt/homebrew/lib"
-- add_links "SDL2"
