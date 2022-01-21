# xo-cmake-boilerplate

A cmake project setup for quickly creating C++ projects using cmake.

---

## Compiling

### Requirements

* Cmake
* Visual Studio 2019

### Tips

If you install cmake with visual studio it can be automatically detected by the scripts in this boilerplate.

### Scripts

**`Generate_<platform>_<arch>`** will generate project files for this platform and arch using cmake.

**`Build_<platform>_<arch>`** same as `Generate_<platform>_<arch>`, but will then compile using cmake as well.

**`Package_<platform>_<arch>`** same as `Build_<platform>_<arch>`, but will then copy the build output as well as the contents of `StartupDir/` to a directory inside `Package/<platform>_<arch>/`. A zip will also be made with the same name in the same location.

**`RENAME_BOILERPLATE`** will rename the relevant files, strings and directories in the boilerplate project. Run this once when setting up a new project with this boilerplate.

#### Options

**-Conf** specifies the configuration for `Build_<platform>_<arch>` or `Package_<platform>_<arch>`. Valid options are `Debug`, `Profile` and `Release`. The default value is `Debug`.

---

## License

No license is offered for this project. If you would like me to add a license, let me know.