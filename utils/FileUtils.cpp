#include <fstream>
#include <iostream>
#include <string>
#include <stdexcept>

using namespace std;

class FileWriter {
public:
    // 构造函数，接收文件路径作为参数
    FileWriter(const string& filePath) : filePath_(filePath) {}

    // 写入单个字符串到文件中
    void writeString(const string& data, bool append = false) {
        ofstream outFile;
        if (append) {
            outFile.open(filePath_, ios::app); // 以追加模式打开文件
        } else {
            outFile.open(filePath_); // 默认覆盖模式打开文件
        }

        if (!outFile.is_open()) {
            throw runtime_error("无法打开文件进行写入: " + filePath_);
        }

        outFile << data;

        if (outFile.fail()) {
            outFile.close();
            throw runtime_error("写入文件时发生错误");
        }

        outFile.close();
    }

private:
    string filePath_; // 文件路径
};

// 示例使用
int main() {
    try {
        FileWriter writer("example.txt");

        // 写入字符串，默认覆盖模式
        writer.writeString("Hello, World!\n");

        writer.writeString("This is a new line.", true);

        cout << "字符串已成功写入文件。\n";
    } catch (const exception& e) {
        cerr << "Error: " << e.what() << '\n';
        return 1;
    }

    return 0;
}