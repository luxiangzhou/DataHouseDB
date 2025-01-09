# 定义变量
CC = g++
CFLAGS = -Wall -g
SRCDIR = src/IO
OBJDIR = build
TARGET = $(OBJDIR)/FileMain

# 源文件列表
SRCS = $(wildcard $(SRCDIR)/*.cpp)
OBJS = $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SRCS))

# 默认目标
all: $(TARGET)

# 编译规则
$(TARGET): $(OBJS)
	@echo " Linking... $@"
	@$(CC) $(CFLAGS) -o $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	@echo " Compiling... $<"
	@$(CC) $(CFLAGS) -c $< -o $@

# 创建构建目录
$(OBJDIR):
	@mkdir -p $@

# 清理生成的文件
clean:
	@rm -rf $(OBJDIR)

.PHONY: all clean