#include <iostream>
#include <string>

std::string processData(const std::string& data){
    std::string result;
    for (char c : data){
        result = result + c;
    }
    return result;
}

int main() {
    std::string input;
    std::string accumulateInput = "";
    std::cout << "DataHouseDB> ";

    while(true){
        //获取用户输入的一行文本
        std::getline(std::cin, input);
        
        //累计输入直到找到分号
        size_t found =  input.find(";"); 
        if (found != std::string::npos){
            //如果找到分号，处理积累的数据
            accumulateInput = accumulateInput + input.substr(0, found);

            //处理积累的数据
            std::string processedData = processData(accumulateInput);

            //输出处理后的数据
            std::cout << "DataHouseDB> " << processedData << std::endl;

            //清空累积输入，准备下一轮输入
            accumulateInput.clear();
        }

        if(input == "exit" || input == "quit"){
                std::cout << "Bye.";
            }

            // if(!userInput.empty()){
            //     std::cout << userInput << "\n";
            // }
            //std::cout << "DataHouseDB> ";
    }

    return 0;

}