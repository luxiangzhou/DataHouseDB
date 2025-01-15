#################### 定义变量 ####################
# 使用C++编译器
CXX = g++
# 编译选项，例如启用所有警告、调试信息、指定C++标准
CXXFLAGS = -Wall -g -std=c++14

# 源码目录
SRCDIR_IO = src/IO
SRCDIR_CLIENT = src/Client

# 对象文件存放目录
OBJDIR = obj
# 最终可执行文件存放目录
BINDIR = build

# 可执行文件
TARGETS = $(BINDIR)/FileMain.exe $(BINDIR)/ShellCommand.exe

# 源文件列表
SRC_FILES_IO = $(wildcard $(SRCDIR_IO)/*.cpp)
SRC_FILES_CLIENT = $(wildcard $(SRCDIR_CLIENT)/*.cpp)

# 目标文件列表
OBJ_FILES_IO = $(patsubst $(SRCDIR_IO)/%.cpp,$(OBJDIR)/%.o,$(SRC_FILES_IO))
OBJ_FILES_CLIENT = $(patsubst $(SRCDIR_CLIENT)/%.cpp,$(OBJDIR)/%.o,$(SRC_FILES_CLIENT))

#################### 默认目标 ####################
all: $(TARGETS)

#################### 构建规则 ####################
# 构建规则： FileMain.exe
$(BINDIR)/FileMain.exe: $(OBJ_FILES_IO)
	@echo "Linking $@"
	@if not exist "$(subst /,\\,$(BINDIR))" mkdir "$(subst /,\\,$(BINDIR))"
	$(CXX) $(LDFLAGS) -o "$@" $^

# 构建规则： ShellCommand.exe
$(BINDIR)/ShellCommand.exe: $(OBJ_FILES_CLIENT)
	@echo "Linking $@"
	@if not exist "$(subst /,\\,$(BINDIR))" mkdir "$(subst /,\\,$(BINDIR))"
	$(CXX) $(LDFLAGS) -o "$@" $^

#################### 编译规则 ####################
# 编译规则： .cpp 文件到 .o 文件
$(OBJDIR)/%.o: $(SRCDIR_IO)/%.cpp | $(OBJDIR)
	@echo "Compiling $<"
	@if not exist "$(dir $@)" mkdir "$(dir $@)"
	$(CXX) $(CXXFLAGS) -c -o "$@" "$<"

$(OBJDIR)/%.o: $(SRCDIR_CLIENT)/%.cpp | $(OBJDIR)
	@echo "Compiling $<"
	@if not exist "$(dir $@)" mkdir "$(dir $@)"
	$(CXX) $(CXXFLAGS) -c -o "$@" "$<"

# 确保对象文件目录存在
$(OBJDIR):
	@if not exist "$@" mkdir "$@"

#################### 清理生成的文件 ####################
clean:
ifeq ($(OS),Windows_NT)
	@powershell -Command "Remove-Item -Recurse -Force -ErrorAction SilentlyContinue '$(subst /,\,$(OBJDIR))' '$(subst /,\,$(BINDIR))'"
else
	@rm -rf $(OBJDIR) $(BINDIR)
endif

.PHONY: all clean