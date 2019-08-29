#/bin/sh
cur_PATH=$(pwd)
cur_lib_src_PATH=$(pwd)/libsrc
cur_lib_PATH=$(pwd)/lib

echo $cur_PATH
echo $cur_lib_src_PATH
echo $cur_lib_PATH

#拷贝到相关路径
cd $cur_lib_src_PATH/00_virtualsystem/
cp -rf ./libvirtualsystem.so ../../lib/

cd $cur_lib_src_PATH/01_common/
cp -rf ./libcommon.so ../../lib/

cd $cur_lib_src_PATH/02_guilib/
cp -rf ./libntgui.so ../../lib/

cd $cur_lib_src_PATH/03_parammodule/
cp -rf ./libparammode.so ../../lib/

cd $cur_lib_src_PATH/04_datamanage/
cp -rf ./libdatamanage.so ../../lib/

cd $cur_lib_src_PATH/05_alarm/
cp -rf ./libalarm.so ../../lib/

cd $cur_lib_src_PATH/06_config/
cp -rf ./libconfigmodule.so ../../lib/

cd $cur_lib_src_PATH/07_inputmodule/
cp -rf ./libinputmodule.so ../../lib/

cd $cur_lib_src_PATH/08_storage/
cp -rf ./libstorage.so ../../lib/

cd $cur_lib_src_PATH/09_patientmanage/
cp -rf ./libpatientmanage.so ../../lib/

cd $cur_PATH/appui/
cp -rf ./appmain ../lib/


cd ../lib
cp -rf libvirtualsystem.so	/Northern/rootfs/rootfs/lib/
cp -rf libcommon.so		/Northern/rootfs/rootfs/lib/
cp -rf libntgui.so		/Northern/rootfs/rootfs/lib/
cp -rf libparammode.so		/Northern/rootfs/rootfs/lib/
cp -rf libdatamanage.so		/Northern/rootfs/rootfs/lib/
cp -rf libalarm.so		/Northern/rootfs/rootfs/lib/
cp -rf libconfigmodule.so		/Northern/rootfs/rootfs/lib/
cp -rf libinputmodule.so		/Northern/rootfs/rootfs/lib/
cp -rf libstorage.so		/Northern/rootfs/rootfs/lib/
cp -rf libpatientmanage.so	/Northern/rootfs/rootfs/lib/
cp -rf appmain 	/Northern/rootfs/rootfs

cd ..
