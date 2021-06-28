# /bin/sh

WORK_DIR="/root/workdir"

# clear previous build
# if [ -d ${WORK_DIR} ]; then
#   rm -rf ${WORK_DIR}/*
#   echo "INFO | Old file exists."
# fi

mkdir -p ${WORK_DIR}
cp -Rf /root/source/* ${WORK_DIR}

# compile gem5
echo "INFO | Compiling gem5..."
cd ${WORK_DIR}/gem5
scons build/X86/gem5.opt -j 8

# compile nvmain without gem5
echo "INFO | Compiling nvmain without gem5."
cd ${WORK_DIR}/nvmain
sed -i -e '/^from\ gem5_scons\ import\ Transform/ s/./# &/' SConscript
scons --build-type=fast

# compile gem5 with nvmain
echo "INFO | Compiling gem5 with nvmain..."
sed -i -e '/^\ \ \ \ # system options/ s/./\ \ \ \ for arg in sys.argv:\n\ \ \ \ \ \ \ \ if arg[:9] == "--nvmain-":\n\ \ \ \ \ \ \ \ \ \ \ \ parser.add_option(arg, type="string", default="NULL", help="Set NVMain configuration value for a parameter")\n\n&/' ${WORK_DIR}/gem5/configs/common/Options.py
sed -i -e '/^# from\ gem5_scons\ import\ Transform/ s//from\ gem5_scons\ import\ Transform/' ${WORK_DIR}/nvmain/SConscript
cd ${WORK_DIR}/gem5
scons EXTRAS=../nvmain build/X86/gem5.opt -j 8

# test
echo "INFO | Testing..."
rm -rf ${WORK_DIR}/result

gcc --static ${WORK_DIR}/benchmark/multiply.c -o ${WORK_DIR}/benchmark/multiply

mkdir -p ${WORK_DIR}/result/multiply_2_way
${WORK_DIR}/gem5/build/X86/gem5.opt ${WORK_DIR}/gem5/configs/example/se.py \
    -c ${WORK_DIR}/benchmark/multiply \
    --cpu-type=TimingSimpleCPU \
    --caches \
    --l2cache \
    --l3cache \
    --l3_assoc=2 \
    --l1i_size=32kB \
    --l1d_size=32kB \
    --l2_size=128kB \
    --l3_size=1MB \
    --mem-type=NVMainMemory \
    --nvmain-config=${WORK_DIR}/nvmain/Config/PCM_ISSCC_2012_4GB.config \
> ${WORK_DIR}/result/multiply_2_way/output.txt
mv ${WORK_DIR}/gem5/m5out/* ${WORK_DIR}/result/multiply_2_way

mkdir -p ${WORK_DIR}/result/multiply_fully_way
${WORK_DIR}/gem5/build/X86/gem5.opt ${WORK_DIR}/gem5/configs/example/se.py \
    -c ${WORK_DIR}/benchmark/multiply \
    --cpu-type=TimingSimpleCPU \
    --caches \
    --l2cache \
    --l3cache \
    --l3_assoc=1 \
    --l1i_size=32kB \
    --l1d_size=32kB \
    --l2_size=128kB \
    --l3_size=1MB \
    --mem-type=NVMainMemory \
    --nvmain-config=${WORK_DIR}/nvmain/Config/PCM_ISSCC_2012_4GB.config \
> ${WORK_DIR}/result/multiply_fully_way/output.txt
mv ${WORK_DIR}/gem5/m5out/* ${WORK_DIR}/result/multiply_fully_way

gcc --static ${WORK_DIR}/benchmark/quicksort.c -o ${WORK_DIR}/benchmark/quicksort

mkdir -p ${WORK_DIR}/result/quicksort_2_way
${WORK_DIR}/gem5/build/X86/gem5.opt ${WORK_DIR}/gem5/configs/example/se.py \
    -c ${WORK_DIR}/benchmark/quicksort \
    --cpu-type=TimingSimpleCPU \
    --caches \
    --l2cache \
    --l3cache \
    --l3_assoc=2 \
    --l1i_size=32kB \
    --l1d_size=32kB \
    --l2_size=128kB \
    --l3_size=1MB \
    --mem-type=NVMainMemory \
    --nvmain-config=${WORK_DIR}/nvmain/Config/PCM_ISSCC_2012_4GB.config \
> ${WORK_DIR}/result/quicksort_2_way/output.txt
mv ${WORK_DIR}/gem5/m5out/* ${WORK_DIR}/result/quicksort_2_way

mkdir -p ${WORK_DIR}/result/quicksort_fully_way
${WORK_DIR}/gem5/build/X86/gem5.opt ${WORK_DIR}/gem5/configs/example/se.py \
    -c ${WORK_DIR}/benchmark/quicksort \
    --cpu-type=TimingSimpleCPU \
    --caches \
    --l2cache \
    --l3cache \
    --l3_assoc=1 \
    --l1i_size=32kB \
    --l1d_size=32kB \
    --l2_size=128kB \
    --l3_size=1MB \
    --mem-type=NVMainMemory \
    --nvmain-config=${WORK_DIR}/nvmain/Config/PCM_ISSCC_2012_4GB.config \
> ${WORK_DIR}/result/quicksort_fully_way/output.txt
mv ${WORK_DIR}/gem5/m5out/* ${WORK_DIR}/result/quicksort_fully_way

# prevent terminate
echo "INFO | End of task..."
tail -f /dev/null