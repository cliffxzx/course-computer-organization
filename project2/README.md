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

## ☑ [Stage 2. Enable L3 last level cache in GEM5 + NVMAIN (15%)](https://github.com/cliffxzx/course-computer-organization/tree/v2.0/project2)

#### Reference

1. [gem5-stable 新增 l3 cache](https://www.twblogs.net/a/5b84c72f2b71775d1cd1cfdf)

## ☑ [Stage 3. Config last level cache to 2-way and full-way associative cache and test performance (15%)](https://github.com/cliffxzx/course-computer-organization/tree/v3.0/project2)

根據 gem5 的說明文件設 1 就是 fully-associative，但是其實可以根據 Block Size 設，也就是 16 \* 1024。

#### Reference

1. [Cache 是怎麼組織和工作的？](https://zhuanlan.zhihu.com/p/31859105)
1. [Homework #1](http://www.utdallas.edu/~gxm112130/EE6304FA17/project1.pdf)
1. [CacheMemory and Cache Replacement Polices](http://www.m5sim.org/Coherence-Protocol-Independent_Memory_Components#CacheMemory_and_Cache_Replacement_Polices)

## ☑ [Stage 4. Modify last level cache policy based on RRIP (15%)](https://github.com/cliffxzx/course-computer-organization/tree/v4.0/project2)

## [Stage 5. Test the performance of write back and write through policy based on 4-way associative cache with isscc_pcm(15%) ](https://github.com/cliffxzx/course-computer-organization/tree/v5.0/project2)

## [Stage 6. Bonus (20%)](https://github.com/cliffxzx/course-computer-organization/tree/v6.0/project2)

### [Stage 6.1. Design last level cache policy to reduce the energy consumption of pcm_based main memory ](https://github.com/cliffxzx/course-computer-organization/tree/v6.1/project2)

### [Stage 6.2. Baseline:LRU](https://github.com/cliffxzx/course-computer-organization/tree/v6.2/project2)
