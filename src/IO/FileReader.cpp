#include "FileReader.h"

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stdexcept>

FileReader::FileReader(const std::string& filename) : filename_(filename), file_(filename) {
    if(!file_.is_open()) {
        throw std::runtime_error("Failed to open file for reading: " + filename_);
    }
}

FileReader::~FileReader() {
    if (file_.is_open()) {
        file_.close();
    }
}

std::vector<std::string> FileReader::readLines() {
    std::vector<std::string> lines;
    std::string line;
    while (std::getline(file_, line)){
        lines.push_back(line);
    }
    return lines;
}
