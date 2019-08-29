#/bin/sh
cur_PATH=$(pwd)
cur_lib_src_PATH=$(pwd)/libsrc
cur_lib_PATH=$(pwd)/lib

echo $cur_PATH
echo $cur_lib_src_PATH
echo $cur_lib_PATH

#1.É¾³ýÉ¾³ýlib
cd lib/
rm -rf libvirtualsystem.so libcommon.so main libntgui.so libparammode.so libdatamanage.so libalarm.so libconfigmodule.so libinputmodule.so libstorage.so libappui.so libpatientmanage.so appmain

cd /Northern/rootfs/rootfs/lib
rm -rf libvirtualsystem.so libcommon.so main libntgui.so libparammode.so libdatamanage.so libalarm.so libconfigmodule.so libinputmodule.so libstorage.so libappui.so libpatientmanage.so


#2.ÒÀ´ÎÇå³ý£¬±àÒë£¬¿½±´µ½Ïà¹ØÂ·¾¶
cd $cur_lib_src_PATH/00_virtualsystem/
make
cp -rf ./libvirtualsystem.so ../../lib/

cd $cur_lib_src_PATH/01_common/
make
cp -rf ./libcommon.so ../../lib/

cd $cur_lib_src_PATH/02_guilib/
make
cp -rf ./libntgui.so ../../lib/

cd $cur_lib_src_PATH/03_parammodule/
make
cp -rf ./libparammode.so ../../lib/

cd $cur_lib_src_PATH/04_datamanage/
make
cp -rf ./libdatamanage.so ../../lib/

cd $cur_lib_src_PATH/05_alarm/
make
cp -rf ./libalarm.so ../../lib/

cd $cur_lib_src_PATH/06_config/
make
cp -rf ./libconfigmodule.so ../../lib/

cd $cur_lib_src_PATH/07_inputmodule/
make
cp -rf ./libinputmodule.so ../../lib/

cd $cur_lib_src_PATH/08_storage/
make
cp -rf ./libstorage.so ../../lib/

cd $cur_lib_src_PATH/09_patientmanage/
make
cp -rf ./libpatientmanage.so ../../lib/

cd $cur_PATH/appui/
make
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
