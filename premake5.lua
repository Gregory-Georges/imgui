workspace "Engine"
    architecture "x64"
    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }


    outputdir = "%{cfg.buildcfg}-%{cf.system}-%{cfg.architecture}"



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
    	    "."
    	}

        files
        {
            "/*.h",
            "/*.cpp"
        }

        defines
        {
            
        }
        
        links
        {

        }


        filter "Configurations:Debug"
            defines "ENGINE_DEBUG"
            symbols "on"
            runtime "debug"

        filter "Configurations:Release"
            defines "ENGINE_RELEASE"
            optimize "on"
            runtime "release"

        filter "Configurations:Dist"
            defines "ENGINE_DIST"
            optimize "on"
            runtime "release"