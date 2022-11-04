Proof of concept UI-only QML implementation of the Mixxx LateNight skin. It does not try to copy the legacy skin exactly and keeping the QML code simple and lean, particularly the layouts, has higher priority than being a pixel perfect copy. 

Requires Qt6

# Build instructions

```
mkdir build
cd build
cmake -DCMAKE_PREFIX_PATH=<Qt 6 installation prefix> ..
```

