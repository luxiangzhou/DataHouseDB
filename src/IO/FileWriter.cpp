#include "FileWriter.h"

#include <fstream>
#include <iostream>
#include <string>
#include <stdexcept>


FileWriter::FileWriter(const std::string& filename) : filename_(filename), file_(filename, std::ios::out | std::ios::trunc) {
    if(!file_.is_open()) {
        throw std::runtime_error("Failed to open file for writing: " + filename_);
    }
}

FileWriter::~FileWriter() {
    if (file_.is_open()) {
        file_.close();
    }
}

void FileWriter::writeLine(const std::string& line) {
    if (file_.is_open()) {
        file_ << line << std::endl;
    } else {
        throw std::runtime_error("File is not open for writing");
    }
}
