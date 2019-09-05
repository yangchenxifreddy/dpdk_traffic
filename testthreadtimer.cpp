
#include <iostream>
#include <thread>
#include <chrono>
#include <vector>
#include <atomic>

#include "Timer.h"
using namespace std;
using namespace chrono;


atomic_long testtotal(0);
atomic_long total(0);
atomic_long statcount(0);


void producerThread(void* param)
{
	for(long i=0;i<10000*10;++i)
{
	statcount+=1;
	//		queue->push(1);	
}  return ;
}

#define COUNT 16
  
void consumerThread(void* param)
{
  
}

void runonesecond()
{
		total+= statcount;
		statcount= 0;
	std::cout<<COUNT*10000-total/10<<" &&&&&&&  total="<<total<<std::endl;
}
	
	
int main(int argc, char* argv[])
{
	
	
	
	std::vector<std::thread> threads;

	
	for(int i=0;i< COUNT;++i)
	{
		threads.push_back(std::thread(producerThread,nullptr));
	}
	std::thread consumerthread(consumerThread,nullptr);

	auto start = system_clock::now();

	Timer t;
	//周期性执行定时任务
	t.StartTimer(100, std::bind(runonesecond));

	for(auto& thread : threads){

	      thread.join();
  }
std::cout<<"****** "<<std::endl;

	std::cout<<"****** "<<std::endl;


	
	consumerthread.join();
	auto end   = system_clock::now();
	auto duration = duration_cast<microseconds>(end - start);
	cout <<  "花费了" 
	<< double(duration.count()) * microseconds::period::num / microseconds::period::den 
	<< "秒" << endl;

  return 0;
}
