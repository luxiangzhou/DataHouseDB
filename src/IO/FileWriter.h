#ifndef FILEWRITER_H
#define FILEWRITER_H

#include <fstream>
#include <string>
#include <stdexcept>

class FileWriter {
public:
    FileWriter(const std::string& filename);
    ~FileWriter();

    void writeLine(const std::string& line);

private:
    std::string filename_;
    std::ofstream file_;
};

#endif
