#ifndef FILEREADER_H
#define FILEREADER_H

#include <fstream>
#include <string>
#include <vector>
#include <stdexcept>

class FileReader {
public:
    FileReader(const std::string& filename);
    ~FileReader();

    std::vector<std::string> readLines();

private:
    std::string filename_;
    std::ifstream file_;
};

#endif