# /bin/sh

# clear previous build
WORK_DIR="/root/workdir"
if [ -d ${WORK_DIR} ]; then
  rm -rf ${WORK_DIR}/*
  echo "INFO | Old file exists."
fi
mkdir -p ${WORK_DIR}
cp -R /root/source/* ${WORK_DIR}

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
./build/X86/gem5.opt configs/example/se.py -c tests/test-progs/hello/bin/x86/linux/hello --cpu-type=TimingSimpleCPU --caches --l2cache --mem-type=NVMainMemory --nvmain-config=../nvmain/Config/PCM_ISSCC_2012_4GB.config

# prevent terminate
echo "INFO | End of task..."
tail -f /dev/null