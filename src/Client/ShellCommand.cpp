#include <iostream>
#include <string>

std::string processData(const std::string& data){
    std::string result;
    if(data.find("create table")){
        //创建表
    }
    


    //修改表

    //插入数据

    //更新数据

    //删除数据

    //查询数据


    return result;
}

int main() {
    std::string input;
    std::string accumulateInput = "";
    std::cout << "DataHouseDB> ";

    while(true){
        //获取用户输入的一行文本
        std::getline(std::cin, input);
        
        //找到分号
        size_t found =  input.find(";"); 
        if (found != std::string::npos){
            //如果找到分号
            accumulateInput = accumulateInput + input.substr(0, found+1);

            //处理积累的数据
            std::string processedData = processData(accumulateInput);

            //输出处理后的数据
            std::cout << processedData << std::endl;

            std::cout << "DataHouseDB> ";

            //清空累积输入，准备下一轮输入
            accumulateInput.clear();
        }else{
            //没有找到分号
            std::cout << "DataHouseDB> ";
            accumulateInput = accumulateInput + input +"\n";

        }

        //退出
        if(input == "exit" || input == "quit"){
            std::cout << "Bye.";
        }
    }

    return 0;

}