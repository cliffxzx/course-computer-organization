# Project 2 - gem5+nvmain

## Environment

### Host

- CPU/RAM: i7-4770k, 16 GB
- Motherboard: ASUS Z87i-pro
- OS: macOS 10.13.16, Darwin Kernel Version 17.7.0

### Client(Docker):

- OS: Ubuntu 18.04

#### Resources

- CPUs: 8
- Memory: 16 GB
- Swap: 4 GB
- Disk Image size: 16GB

## ☑ [Stage 1. GEM5 + NVMAIN BUILD-UP (40%)](https://github.com/cliffxzx/course-computer-organization/tree/v1.0/project2)

Just follow the ppt steps.

## ☑ [Stage 2. Enable L3 last level cache in GEM5 + NVMAIN (15%)](https://github.com/cliffxzx/course-computer-organization/tree/v2.0/project2)

Follow the tutorials.

#### Reference

1. [gem5-stable 新增 l3 cache](https://www.twblogs.net/a/5b84c72f2b71775d1cd1cfdf)

## ☑ [Stage 3. Config last level cache to 2-way and full-way associative cache and test performance (15%)](https://github.com/cliffxzx/course-computer-organization/tree/v3.0/project2)

Follow the gem5 official documentation, the assoc set to 1 is fully-associative. Also can set according to block size = 16 \* 1024

#### Reference

1. [Cache 是怎麼組織和工作的？](https://zhuanlan.zhihu.com/p/31859105)
1. [Homework #1](http://www.utdallas.edu/~gxm112130/EE6304FA17/project1.pdf)
1. [CacheMemory and Cache Replacement Polices](http://www.m5sim.org/Coherence-Protocol-Independent_Memory_Components#CacheMemory_and_Cache_Replacement_Polices)

## ☑ [Stage 4. Modify last level cache policy based on RRIP (15%)](https://github.com/cliffxzx/course-computer-organization/tree/v4.0/project2)

There are internal cache policy in gem5, so just call it.

## ☑ [Stage 5. Test the performance of write back and write through policy based on 4-way associative cache with isscc_pcm(15%) ](https://github.com/cliffxzx/course-computer-organization/tree/v5.0/project2)

line 581: miss rate higher

#### Reference

1. [The gem5 Memory System](https://www.gem5.org/documentation/general_docs/memory_system/gem5_memory_system/)

## [Stage 6. Bonus (20%)](https://github.com/cliffxzx/course-computer-organization/tree/v6.0/project2)

### [Stage 6.1. Design last level cache policy to reduce the energy consumption of pcm_based main memory ](https://github.com/cliffxzx/course-computer-organization/tree/v6.1/project2)

### [Stage 6.2. Baseline:LRU](https://github.com/cliffxzx/course-computer-organization/tree/v6.2/project2)
