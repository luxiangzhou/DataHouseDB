#################### 定义变量 ####################
# 使用C++编译器
CXX = g++
# 编译选项，例如启用所有警告、调试信息、指定C++标准
CXXFLAGS = -Wall -g -std=c++14

# 源码目录
SRCDIR_IO = src/IO
SRCDIR_CLIENT = src/Client

# 最终可执行文件存放目录
BINDIR = build
# 对象文件存放目录
OBJDIR = build/obj

# 可执行文件
TARGETS = $(BINDIR)/FileMain.exe $(BINDIR)/ShellCommand.exe

# 源文件列表
SRC_FILES_IO = $(wildcard $(SRCDIR_IO)/*.cpp)
SRC_FILES_CLIENT = $(wildcard $(SRCDIR_CLIENT)/*.cpp)

# 目标文件列表
OBJ_FILES_IO = $(patsubst $(SRCDIR_IO)/%.cpp,$(OBJDIR)/%.o,$(SRC_FILES_IO))
OBJ_FILES_CLIENT = $(patsubst $(SRCDIR_CLIENT)/%.cpp,$(OBJDIR)/%.o,$(SRC_FILES_CLIENT))

#################### 默认目标 ####################
.PHONY: all clean
all: $(TARGETS)

#################### 编译规则 ####################
# 创建build/obj目录
$(OBJDIR): | $(BINDIR)
	@echo "create OBJDIR ..."
	@if not exist "$@" mkdir "$@"

# 编译规则： .cpp 文件到 .o 文件
$(OBJDIR)/%.o: $(SRCDIR_IO)/%.cpp | $(OBJDIR)
	@echo "execute compiling $< ..."
	$(CXX) $(CXXFLAGS) -c -o "$@" "$<"

$(OBJDIR)/%.o: $(SRCDIR_CLIENT)/%.cpp | $(OBJDIR)
	@echo "execute compiling $< ..."
	$(CXX) $(CXXFLAGS) -c -o "$@" "$<"

#################### 链接规则 ####################
# 创建build目录 
$(BINDIR):
	@echo "create BINDIR ..."
	@if not exist "$@" mkdir "$@"

# 链接规则： FileMain.exe
$(BINDIR)/FileMain.exe: $(OBJ_FILES_IO) | $(BINDIR)
	@echo "execute linking $@ ..."
	$(CXX) $(LDFLAGS) -o "$@" $^

# 链接规则： ShellCommand.exe
$(BINDIR)/ShellCommand.exe: $(OBJ_FILES_CLIENT) | $(BINDIR)
	@echo "execute linking $@ ..."
	$(CXX) $(LDFLAGS) -o "$@" $^

#################### 清理生成的文件 ####################
clean:
ifeq ($(OS),Windows_NT)
	@echo "execute windows clean ..."
	@if exist "$(subst /,\,$(OBJDIR))" rmdir /S /Q "$(subst /,\,$(OBJDIR))"
	@if exist "$(subst /,\,$(BINDIR))" rmdir /S /Q "$(subst /,\,$(BINDIR))"
else
	@echo "execute linux clean ..."
	@rm -rf $(OBJDIR) $(BINDIR)
endif
