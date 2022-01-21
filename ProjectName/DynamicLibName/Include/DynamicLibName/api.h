#pragma once

#ifdef DYNAMICLIBNAME_EXPORT
#define DYNAMICLIBNAME __declspec(dllexport)
#else
#define DYNAMICLIBNAME __declspec(dllimport)
#endif

namespace DynamicLibName
{



    DYNAMICLIBNAME void aip();
}