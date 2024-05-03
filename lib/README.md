<div align="center" width="100%">

# `lib`: Project Private Libraries

</div>

PlatformIO will compile these project specific private libs to static libraries and link into the executable.

The source code of each lib is placed in its own directory: `lib/library_name/[source files]`.

## Structure of library `LoRa32`

``` ascii
|--lib
|  |
|  |--LoRa32
|  |  |--docs
|  |  |--examples
|  |  |--src
|  |     |- LoRa32.c
|  |     |- LoRa32.h
|  |  |- library.json - Build options, etc.: https://docs.platformio.org/page/librarymanager/config.html
|
|- platformio.ini
|--src
   |- main.cpp
   |- ...
```

### Contents of `main.cpp`

``` cpp
#include <LoRa32.h>

int main (void) {
  // ...
}
```

> [!NOTE]
> PlatformIOs [Library Dependency Finder (LDF)](https://docs.platformio.org/page/librarymanager/ldf.html) will automatically find dependent libs when scanning the project source files.
