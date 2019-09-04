#include "classfactory.h"

int main()
{
    //注册
    ClassFactory::getInstance().registClass("Test", create_Test);

    //获取类对象
    Test *t = (Test*)ClassFactory::getInstance().getClassByName("Test");
    if (!t){
        std::cout << "get instnce Test err;" << std::endl;
        return 1;
    }   
    
    t->print();
    delete t;
    return 0;
}