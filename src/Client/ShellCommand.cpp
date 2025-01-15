#include <iostream>
#include <string>

int main() {
    std::string userInput;
    std::cout << "DataHouseDB> ";

    //获取用户输入的一行文本
    if (std::getline(std::cin, userInput)){
        std::cout << userInput << "\n";
    }

    return 0;

}