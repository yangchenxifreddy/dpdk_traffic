#ifndef __CLASSFACTORY_
#define __CLASSFACTORY_

#include <iostream>
#include<string>
#include<map>

//定义函数指针
typedef void* (*create_fun)();

class ClassFactory{
public:
    ~ClassFactory() {}; 

    //根据类注册时的名字, 创建类实例, 并返回
    void* getClassByName(std::string name){
        std::map<std::string, create_fun>::iterator it = my_map.find(name);
        if (it == my_map.end()) { return NULL; }

        create_fun fun = it->second;
        if (!fun) { return NULL; }

        return fun();
    }   

    //注册类名称与指针函数到映射关系
    void registClass(std::string name, create_fun fun){
        my_map[name] = fun;
    }   

    //单例模式
    static ClassFactory& getInstance(){
        static ClassFactory fac;
        return fac;
    }   

private:
    ClassFactory() {};  //私有
    std::map<std::string, create_fun> my_map;
}; 




class Test{
public:
    Test(){ std::cout << "call Test Constructor fun" << std::endl; }
    ~Test(){ std::cout << "call Test Destructor fun" << std::endl; }
    void print(){ std::cout << "call Test print fun" << std::endl; }
};

void* create_Test(){
    Test *t = new Test;
    return (t == NULL)? NULL:t;
}

#endif