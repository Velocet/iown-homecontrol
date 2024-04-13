# Project Specific Private Libraries.

PlatformIO will compile them to static libraries and link into executable file.

The source code of each library is placed in an own separate directory: `lib/library_name/[source files]`.

Structure of the library `LibName`:

```
|--lib
|  |
|  |--LibName
|  |  |--docs
|  |  |--examples
|  |  |--src
|  |     |- LibName.c
|  |     |- LibName.h
|  |  |- library.json (Custom build options, etc.) https://docs.platformio.org/page/librarymanager/config.html
|
|- platformio.ini
|--src
   |- main.cpp
```

Contents of `src/main.cpp`:

```CPP
#include <LibName.h>

int main (void) {
  // ...
}
```

[PlatformIO Library Dependency Finder](https://docs.platformio.org/page/librarymanager/ldf.html) will find automatically dependent libraries scanning project source files.
