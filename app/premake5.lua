-----------------------------------------------
-- Client configuration file.
-----------------------------------------------
project "GuiDemo"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"
    runtime "Debug"

    targetdir("%{wks.location}/build/bin/" .. outputdir .. "/%{prj.name}")
    objdir("%{wks.location}/build/bin-int/" .. outputdir .. "/%{prj.name}")

    -- Define the location(s) of files.
    files {
        "%{wks.location}/app/include/**.h",
		"%{wks.location}/app/source/**.cpp",
    }
    
    -- This is the place to add filters.
    vpaths {
        ["Headers/"] = { "**.h", "**.hpp" },
        ["Sources/"] = { "**.c", "**.cpp"},
    }

     -- Define a macro/symbol which applies on a windows system.
     filter "configurations:*"
		defines { "_WIN32", "SFML_DYNAMIC" }
		includedirs { 
            "%{wks.location}/app/source/",
            "%{wks.location}/app/include/",
            "%{wks.location}/libs/sfml/include/",
        }
		libdirs { "%{wks.location}/libs/sfml/lib" }
		links {
			"opengl32",
			"freetype",
			"winmm",
			"gdi32",
			"flac",
			"vorbisenc",
			"vorbisfile",
			"vorbis",
			"ogg",
			"ws2_32"
		}

    -- Define a macro/symbol which applies only to debug builds.
    filter "configurations:Debug"
        defines{"_DEBUG", "_UNICODE", "UNICODE"}
		symbols "On"
		links {	
			"sfml-graphics-d",
			"sfml-window-d",
			"sfml-system-d",
			"sfml-audio-d",
			"sfml-network-d"
		}
        -- SFML debug dlls.
        postbuildcommands {
            "{COPYFILE} %{wks.location}/resources/dlls/sfml-graphics-d-2.dll %{wks.location}/build/bin/" .. outputdir .. "/GuiDemo/",
            "{COPYFILE} %{wks.location}/resources/dlls/sfml-audio-d-2.dll %{wks.location}/build/bin/" .. outputdir .. "/GuiDemo/",
            "{COPYFILE} %{wks.location}/resources/dlls/sfml-system-d-2.dll %{wks.location}/build/bin/" .. outputdir .. "/GuiDemo/",
            "{COPYFILE} %{wks.location}/resources/dlls/sfml-window-d-2.dll %{wks.location}/build/bin/" .. outputdir .. "/GuiDemo/",
            "{COPYFILE} %{wks.location}/resources/dlls/sfml-network-d-2.dll %{wks.location}/build/bin/" .. outputdir .. "/GuiDemo/",
            "{COPYFILE} %{wks.location}/resources/dlls/openal32.dll %{wks.location}/build/bin/" .. outputdir .. "/GuiDemo/",
		}


    -- Define a macro/symbol which applies only to release builds.
	filter "configurations:Release"
        defines{"NDEBUG", "_UNICODE", "UNICODE"}
		optimize "On"
		links {	
			"sfml-graphics",
			"sfml-window",
			"sfml-system",
			"sfml-audio",
			"sfml-network"
		}
        -- SFML release dlls.
        postbuildcommands {
            "{COPYFILE} %{wks.location}/resources/dlls/sfml-graphics-2.dll %{wks.location}/build/bin/" .. outputdir .. "/Client/",
            "{COPYFILE} %{wks.location}/resources/dlls/sfml-audio-2.dll %{wks.location}/build/bin/" .. outputdir .. "/Client/",
            "{COPYFILE} %{wks.location}/resources/dlls/sfml-system-2.dll %{wks.location}/build/bin/" .. outputdir .. "/Client/",
            "{COPYFILE} %{wks.location}/resources/dlls/sfml-window-2.dll %{wks.location}/build/bin/" .. outputdir .. "/Client/",
            "{COPYFILE} %{wks.location}/resources/dlls/sfml-network-2.dll %{wks.location}/build/bin/" .. outputdir .. "/Client/",
            "{COPYFILE} %{wks.location}/resources/dlls/openal32.dll %{wks.location}/build/bin/" .. outputdir .. "/Client/",
		}