# Undefined Behavior Study
A study of undefined behavior on various platforms, compilers, and tools. The undefined behavior types were inspired by https://www.nayuki.io/page/undefined-behavior-in-c-and-cplusplus-programs.

## Automated Results

Linux 
[![Build Status](https://travis-ci.org/geoffviola/undefined_behavior_study.svg?branch=master)](https://travis-ci.org/geoffviola/undefined_behavior_study)

Windows 
[![Build status](https://ci.appveyor.com/api/projects/status/sewu7060d0mn6v8i/branch/master?svg=true)](https://ci.appveyor.com/project/geoffviola/undefined_behavior_study/branch/master)

## Compiler Study
### Breakdown
Compiler | Undefined Behavior Type | Warnings | Debug | RelWithDebInfo
--- | --- | --- | --- | ---
clang | array out of bounds | ❌ | ❌ | ❌ |
clang | dereferencing nullptr | ❌ | ✔️ | ❌ |
clang | divide by zero | ✔️ | ✔️ | ❌ |
clang | out of bounds pointer | ❌ | ❌ | ❌ |
clang | reading uninitialized value add | ✔️ -Wall  | ❌| ❌ |
clang | reading uninitialized value cout | ✔️ -Wall  | ❌| ❌ |
clang | reading uninitialized value if | ✔️ -Wall  | ❌| ❌ |
clang | reading uninitialized value printf | ✔️ -Wall  | ❌| ❌ |
clang | shifting more than width | ✔️ | ❌ | ❌ |
clang | signed integer overflow | ❌ | ❌ | ❌ |
clang | stack overflow | ✔️ -Wall  | ✔️ | ✔️ |
gcc | array out of bounds | ❌ | ❌ | ❌ |
gcc | dereferencing nullptr | ❌ | ✔️ | ✔️ |
gcc | divide by zero | ✔️ | ✔️ | ✔️ |
gcc | out of bounds pointer | ❌ | ❌ | ❌ |
gcc | reading uninitialized value add | ✔️ /Wall | ❌| ❌ |
gcc | reading uninitialized value cout | ✔️ /Wall | ❌| ❌ |
gcc | reading uninitialized value if | ✔️ /Wall | ❌| ❌ |
gcc | reading uninitialized value printf | ✔️ /Wall | ❌| ❌ |
gcc | shifting more than width | ✔️ | ❌ | ❌ |
gcc | signed integer overflow | ❌ | ❌ | ❌ |
gcc | stack overflow | ❌ | ✔️ | ✔️ |
MSVC | array out of bounds | ❌ | ✔️ | ❌ |
MSVC | dereferencing nullptr | ❌ | ✔️ | ✔️ |
MSVC | divide by zero | ✔️ /W3 | ✔️ | ✔️ |
MSVC | out of bounds pointer | ❌ | ❌ | ❌ |
MSVC | reading uninitialized value add | ✔️ /W1 | ✔️ | ❌ |
MSVC | reading uninitialized value cout | ✔️ /W1 | ✔️ | ❌ |
MSVC | reading uninitialized value if | ✔️ /W1 | ✔️ | ❌ |
MSVC | reading uninitialized value printf | ✔️ /W1 | ✔️ | ❌ |
MSVC | shifting more than width | ✔️ /W1 | ❌ | ❌ |
MSVC | signed integer overflow | ❌ | ❌ | ❌ |
MSVC | stack overflow | ✔️ /W1 | ✔️ | ✔️ |

### Overview
Undefined Behavior Type | Warnings | Debug | RelWithDebInfo
--- | --- | --- | ---
array out of bounds | ❌ | MSVC | ❌ |
dereferencing nullptr | ❌ | clang, gcc, MSVC | gcc, MSVC |
divide by zero | clang, gcc, MSVC | clang, gcc, MSVC | gcc, MSVC |
out of bounds pointer | ❌ | ❌ | ❌ |
reading uninitialized value add | clang, gcc, MSVC | MSVC | ❌ |
reading uninitialized value cout | clang, gcc, MSVC | MSVC | ❌ |
reading uninitialized value if | clang, gc, MSVCc | MSVC | ❌ |
reading uninitialized value printf | clang, gcc, MSVC | MSVC | ❌ |
shifting more than width | clang, gcc | ❌ | ❌ |
signed integer overflow | ❌ | ❌ | ❌ |
stack overflow | clang, MSVC | clang, gcc, MSVC | clang, gcc, MSVC |


## Dynamic Analyzer Study

Tool | Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | --- | ---
clang address sanitizer | clang | array out of bounds | ✔️  | ❌  |
clang address sanitizer | clang | dereferencing nullptr | ✔️ | ❌  |
clang address sanitizer | clang | divide by zero | ✔️ | ❌ |
clang address sanitizer | clang | out of bounds pointer | ❌ |  ❌  |
clang address sanitizer | clang | reading uninitialized value add | ❌  | ❌  |
clang address sanitizer | clang | reading uninitialized value cout | ❌  | ❌  |
clang address sanitizer | clang | reading uninitialized value if | ❌  | ❌ |
clang address sanitizer | clang | reading uninitialized value printf | ❌  | ❌   |
clang address sanitizer | clang | shifting more than width | ❌   | ❌ |
clang address sanitizer | clang | signed integer overflow | ❌  | ❌ |
clang address sanitizer | clang | stack overflow | ✔️   | ❌ |
clang undefined sanitizer | clang | array out of bounds | ❌ | ✔️ |
clang undefined sanitizer | clang | dereferencing nullptr | ✔️ | ✔️ |
clang undefined sanitizer | clang | divide by zero | ✔️ | ✔️ |
clang undefined sanitizer | clang | out of bounds pointer | ❌ | ❌  |
clang undefined sanitizer | clang | reading uninitialized value add | ❌ | ✔️ |
clang undefined sanitizer | clang | reading uninitialized value cout | ❌ | ❌ |
clang undefined sanitizer | clang | reading uninitialized value if | ❌ | ❌ |
clang undefined sanitizer | clang | reading uninitialized value printf | ❌ | ❌ |
clang undefined sanitizer | clang | shifting more than width | ✔️ | ✔️ |
clang undefined sanitizer | clang | signed integer overflow | ✔️ | ✔️ |
clang undefined sanitizer | clang | stack overflow | ✔️ | ❌ |
valgrind | gcc | array out of bounds | ❌ | ❌ |
valgrind | gcc | dereferencing nullptr | ✔️ | ✔️ |
valgrind | gcc | divide by zero | ✔️ | ✔️ |
valgrind | gcc | out of bounds pointer | ❌ | ❌ |
valgrind | gcc | reading uninitialized value add | ✔️| ✔️ |
valgrind | gcc | reading uninitialized value cout | ✔️| ✔️ |
valgrind | gcc | reading uninitialized value if | ✔️| ✔️ |
valgrind | gcc | reading uninitialized value printf | ✔️| ✔️ |
valgrind | gcc | shifting more than width | ❌ | ❌ |
valgrind | gcc | signed integer overflow | ❌ | ❌ |
valgrind | gcc | stack overflow | ✔️ | ✔️ |

## Versions
- Linux 6e685b1d7f64 4.4.0-101-generic #124~14.04.1-Ubuntu SMP Fri Nov 10 19:05:36 UTC 2017 x86\_64 x86\_64 x86\_64 GNU/Linux
- clang: 6.0.0-1ubuntu2 (tags/RELEASE\_600/final)
- GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0 -std=c++17
- MSVC: 2015 Version 14.0.25431.01 Update 3
- valgrind: 3.13.0

## Notes
Passing means the process halted. Tests were on intel x86\_64. MSVC was tested on Windows 10 and the rest was tested on Ubuntu 16.04. Debug mode and RelWithDebInfo is in reference to CMake's build types.

There is only one case of each type. It's expected that slightly different implementations of the same types of undefined behavior may yield different results.

## Analysis
When in debug mode, MSVC halted on the most undefined behavior. Clang and GCC both benefited with the additional "-Wall" flag to catch undefined behavior as warnings. No extra flags made MSVC catch more undefined behavior.

Valgrind caught a few more cases of undefined behavior over running the programs directly. The additional cases were reading uninitialized values and dereferencing an array out of its bounds. It did provide more actionable messages than just "seg fault." Clang with "-fsanitize=undefined" performed much better in RelWithDebInfo mode over just Debug mode. It caught all types but reading from an uninitialized value and out of bounds pointer. Clang with "-fsanitize=address" was able to identify the array out of bounds error over the undefined option, but didn't detect other use cases. Once the optimizer works, the address sanitizer is not effective at detecting undefined behavior.

Reading from an uninitialized value is a very common mistake for beginners and experts. Compilers sometimes catch it as warnings. Valgrind can detect it, but clang with fsantize can often miss it.

## 2018/10/14 Changes
In moving from Ubuntu 16.04 like tools to 18.04 tools, valgrind stopped checking array boundaries. See commit: d13924dde2183abc687c5108825941218e078ebe. There was also a typo on how clang fsanitize handles stack overflow in release with debug info.

