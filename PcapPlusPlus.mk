PCAPPLUSPLUS_HOME := Drive:/your/PcapPlusPlus/folder
MINGW_HOME := Drive:/MinGW/folder
WINPCAP_HOME := Drive:/WpdPack/folder
### COMMON ###

# includes
PCAPPP_INCLUDES := -I$(PCAPPLUSPLUS_HOME)/header

# libs dir
PCAPPP_LIBS_DIR := -L$(PCAPPLUSPLUS_HOME)

# libs
PCAPPP_LIBS := -lPcap++ -lPacket++ -lCommon++

# post build
PCAPPP_POST_BUILD :=

# build flags
PCAPPP_BUILD_FLAGS :=

ifdef PCAPPP_ENABLE_CPP_FEATURE_DETECTION
        PCAPPP_BUILD_FLAGS += -DPCAPPP_CPP_FEATURE_DETECTION -std=c++11 
endif
### WIN32 - MINGW-W64 ###

# includes
PCAPPP_INCLUDES += -I$(WINPCAP_HOME)/Include

# libs dir
PCAPPP_LIBS_DIR += -L$(WINPCAP_HOME)/lib -L$(MINGW_HOME)/lib

# libs
PCAPPP_LIBS += -lwpcap -lPacket -lpthread -lws2_32 -liphlpapi

# flags
PCAPPP_BUILD_FLAGS += -static -static-libgcc -static-libstdc++ -DPCAPPP_MINGW_ENV


