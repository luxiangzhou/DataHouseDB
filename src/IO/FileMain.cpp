
#include <iostream>
#include "FileWriter.h"
#include "FileReader.h"

int main() {
    try {
        //写入文件
        {
            FileWriter writer("example.txt");
            writer.writeLine("hello world1;");
            writer.writeLine("hello world2;");
            writer.writeLine("hello world3;");
        }

        //读取文件
        {
            FileReader reader("example.txt");
            auto lines = reader.readLines();

            for (const auto& line : lines){
                std::cout << line << std::endl;
            }
        }
    } catch (const std::exception& e){
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
    return 0;
}