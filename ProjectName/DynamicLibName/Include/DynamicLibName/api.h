#pragma once

#ifdef DYNAMICLIBNAME_EXPORTS
#define DYNAMICLIBNAME_EXPORT __declspec(dllexport)
#else
#define DYNAMICLIBNAME_EXPORT __declspec(dllimport)
#endif

namespace DynamicLibName
{



    DYNAMICLIBNAME_EXPORT void aip();
}