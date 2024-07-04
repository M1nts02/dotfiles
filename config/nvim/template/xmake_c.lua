-- AUTHOR: ${_AUTHOR_}
-- EMAIL: ${_EMAIL_}
-- DATE: ${_DATE(%Y-%B-%A)_}
add_rules("mode.debug", "mode.release")
set_languages("c17", "c++17")

-- local baseline = "c202ce4d469096bd6d46fe65de74a4737beee01b"
-- add_requires("vcpkg::sdl2", { configs = { baseline = baseline }, alias = "sdl2" })

-- add_requires "SDL2"

target "main"
set_kind "binary"
add_files "src/*.c"
-- add_packages "SDL2"
