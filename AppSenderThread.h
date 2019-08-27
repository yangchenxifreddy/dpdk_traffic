#pragma once

#include "Common.h"
#include "RawPacket.h"
#include "Packet.h"
#include "PcapFileDevice.h"
#include "PcapPlusPlusVersion.h"
#include "SystemUtils.h"
#include "PacketUtils.h"
#include "DpdkDevice.h"
#include "DpdkDeviceList.h"
#include "PcapFileDevice.h"

using namespace pcpp;

/**
 * The worker thread class which does all the work. It's initialized with pointers to the RX and TX devices, then it runs in
 * an endless loop which reads packets from the RX device and sends them to the TX device.
 * The endless loop is interrupted only when the thread is asked to stop (calling its stop() method)
 */
class AppSenderThread : public DpdkWorkerThread
{
private:
	AppWorkerConfig& m_WorkerConfig;
	bool m_Stop;
	uint32_t m_CoreId;

public:
	AppSenderThread(AppWorkerConfig& workerConfig) :
		m_WorkerConfig(workerConfig), m_Stop(true), m_CoreId(MAX_NUM_OF_CORES+1)
	{
	}

	virtual ~AppSenderThread()
	{
		// do nothing
	}

	// implement abstract methods

	bool run(uint32_t coreId)
	{
		m_CoreId = coreId;
		m_Stop = false;
		DpdkDevice* rxDevice = m_WorkerConfig.RxDevice;
		DpdkDevice* txDevice = m_WorkerConfig.TxDevice;

		// if no DPDK devices were assigned to this worker/core don't enter the main loop and exit
		if (!rxDevice || !txDevice)
		{
			return true;
		}
	  std::vector<RawPacket> rawPackList;
		std::string inputPcapFileName="/snjdju/work/pcapfile/big.pcap";
		// open a pcap/pcapng file for reading
		IFileReaderDevice* reader = IFileReaderDevice::getReader(inputPcapFileName.c_str());

		if (!reader->open())
		{
			delete reader;
			EXIT_WITH_ERROR("Error opening input pcap file\n");
		}

		PcapFileReaderDevice* pcapReader = dynamic_cast<PcapFileReaderDevice*>(reader);

		// read packets from the file until end-of-file or until reached user requested packet count
		int packetCountSoFar = 0;
		RawPacket rawPacket;
		while (pcapReader->getNextPacket(rawPacket))
		{
			rawPackList.push_back(rawPacket);
			packetCountSoFar++;
		}
	

		// main loop, runs until be told to stop
		while (!m_Stop)
		{
					for(std::vector<RawPacket>::iterator iter= rawPackList.begin();iter!= rawPackList.end();++iter)
					txDevice->sendPacket((*iter),0,false);
		}


		return true;
	}

	void stop()
	{
		// assign the stop flag which will cause the main loop to end
		m_Stop = true;
	}

	uint32_t getCoreId()
	{
		return m_CoreId;
	}

};
