-----------------------------------------------
-- Solution configuration file.
-----------------------------------------------
workspace "GUI-SFML"
    system "Windows"
    architecture "x86_64"
    flags { 
        "MultiProcessorCompile" 
    }
    
    configurations {
        "Debug",
        "Release"
    }

    -- Set the startup project.
    startproject "GuiDemo"


outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Subprojects.
include "app"

-----------------------------------------------
-- Cleanup configuration.
-----------------------------------------------
newaction {
    trigger = "clean",
    description = "Remove all binaries and intermediate binaries, and vs files.",
    execute = function()
        print("Removing binaries")
        os.rmdir("build/bin")

        print("Removing intermediate binaries")
        os.rmdir("build/bin-int")

        print("Removing project files")
        os.rmdir("./.vs")
        os.remove("**.sln")
        os.remove("**.vcxproj")
        os.remove("**.vcxproj.filters")
        os.remove("**.vcxproj.user")
        print("Done")
    end
}