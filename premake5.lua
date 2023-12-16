workspace "imgui"
    architecture "x64"
    configurations
    {
        "Dist"
    }


    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"



------------------------------------------------------------------------------
-- imgui
------------------------------------------------------------------------------

project "imgui"
    location "imgui"
    kind "staticlib"
    language "C++"
    cppdialect "c++17"
    staticruntime "on"

    targetdir (".")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    	includedirs
    	{
    	    ".",
            "../glfw/include"
    	}

        files
        {
            "./*.h",
            "./*.cpp"
        }

        defines
        {
            
        }
        
        links
        {

        }

        filter "Configurations:Dist"
            optimize "on"
            runtime "release"