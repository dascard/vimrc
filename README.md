# Dascard's Vim Configuration

一个现代化、功能丰富的 Vim 配置，专为开发工作流程优化。

## 🌟 特性

### 核心功能
- **现代插件管理**: 使用 Vundle 进行插件管理
- **智能代码补全**: COC.nvim 提供 LSP 支持
- **AI 代码助手**: GitHub Copilot 集成
- **异步任务系统**: AsyncTasks 和 AsyncRun 支持
- **优雅主题**: Tokyo Night 主题配置
- **终端集成**: Floaterm 浮动终端

### 开发工具
- **语言支持**: C/C++, Java, Python, JavaScript, TypeScript, Markdown
- **调试支持**: Vimspector 调试器集成
- **构建系统**: 统一的 F5-F8 快捷键构建和运行
- **文件管理**: NERDTree 文件浏览器
- **Git 集成**: Fugitive Git 支持
- **代码格式化**: Prettier 和语言特定格式化工具

### UI 增强
- **状态栏**: Airline 状态栏美化
- **启动页面**: Startify 优雅启动界面
- **图标支持**: Nerd Fonts 图标集成
- **按键提示**: Which-Key 快捷键提示系统

## 📦 安装

### 先决条件
```bash
# 安装 Node.js (COC.nvim 需要)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# 安装 Python 支持
sudo apt-get install python3-pip

# 安装 Nerd Font (推荐 JetBrains Mono)
# 下载并安装 JetBrainsMono Nerd Font
```

### 配置安装
```bash
# 1. 备份现有配置
mv ~/.vimrc ~/.vimrc.backup 2>/dev/null || true
mv ~/.vim ~/.vim.backup 2>/dev/null || true

# 2. 克隆配置
git clone <your-repo-url> ~/.vim/config
cd ~/.vim/config

# 3. 创建符号链接
ln -sf ~/.vim/config/.vimrc ~/.vimrc
ln -sf ~/.vim/config/coc-settings.json ~/.vim/coc-settings.json
mkdir -p ~/.vim/tasks
ln -sf ~/.vim/config/tasks.ini ~/.vim/tasks/tasks.ini

# 4. 安装 Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 5. 安装插件
vim +PluginInstall +qall
```

## ⌨️ 快捷键

### 基础快捷键
| 快捷键 | 功能 |
|--------|------|
| `jk` | 退出插入模式 |
| `;` | Leader 键 |
| `Ctrl+s` | 保存文件 |
| `Ctrl+a` | 全选 |
| `Ctrl+c` | 复制选中内容 |

### 窗口导航
| 快捷键 | 功能 |
|--------|------|
| `←` | 切换到左侧窗口 |
| `→` | 切换到右侧窗口 |
| `↑` | 切换到上方窗口 |
| `↓` | 切换到下方窗口 |
| `Ctrl+x` | 交换窗口 |

### 构建和运行 (AsyncTasks)
| 快捷键 | 功能 |
|--------|------|
| `F5` | 运行任务 |
| `F6` | 构建任务 |
| `F7` | 文件运行 |
| `F8` | 构建并运行 |

### Leader 键映射 (`;`)
| 快捷键 | 功能 |
|--------|------|
| `;w` | 保存文件 |
| `;q` | 退出 |
| `;h` | 向左移动 |
| `;j` | 向下移动 |
| `;k` | 向上移动 |
| `;l` | 向右移动 |
| `;=` | 格式化代码 (Prettier) |

### Space 键映射
| 快捷键 | 功能 |
|--------|------|
| `Space+f` | 查找文件 |
| `Space+b` | 缓冲区管理 |
| `Space+w` | 窗口操作 |
| `Space+t` | 终端操作 |
| `Space+g` | Git 操作 |
| `Space+d` | 调试操作 |

### 插件快捷键
| 快捷键 | 功能 |
|--------|------|
| `F2` | NERDTree 切换 |
| `F4` | Tagbar 切换 |
| `F12` | 浮动终端 |

## 🔧 配置文件

### 主要配置文件
- `.vimrc` - 主配置文件
- `coc-settings.json` - COC.nvim 语言服务器配置
- `tasks.ini` - AsyncTasks 任务配置
- `.vimspector.json` - 调试器配置 (需要在项目中创建)

### 任务系统 (tasks.ini)
```ini
# C++ 项目示例
[file-build]
command:c,cpp=g++ -std=c++17 -Wall -g -o "$(VIM_PATHNOEXT)" "$(VIM_FILEPATH)"
cwd=$(VIM_FILEDIR)

[file-run]
command:c,cpp="$(VIM_PATHNOEXT)"
cwd=$(VIM_FILEDIR)
output=terminal

# Python 项目示例
[file-run]
command:python=python3 "$(VIM_FILEPATH)"
cwd=$(VIM_FILEDIR)
output=terminal
```

## 🎨 主题配置

默认使用 Tokyo Night 主题，支持：
- GUI 和终端模式
- 透明背景 (终端模式)
- 斜体支持
- 真彩色支持

## 🔍 代码补全和 LSP

### 支持的语言服务器
- **C/C++**: clangd
- **Python**: pyright
- **JavaScript/TypeScript**: typescript-language-server
- **Java**: eclipse.jdt.ls
- **Go**: gopls
- **Rust**: rust-analyzer

### 安装语言服务器
```bash
# 通过 COC 安装
:CocInstall coc-clangd coc-pyright coc-tsserver coc-java coc-go coc-rust-analyzer
```

## 📝 使用技巧

### 1. 新建文件模板
创建新文件时自动插入文件头注释，包含：
- 文件名
- 作者信息
- 创建时间
- 语言特定的包含语句

### 2. 自动补全
- 括号自动配对
- 智能代码补全
- 代码片段支持

### 3. 调试支持
使用 Vimspector 进行调试：
```vim
:VimspectorToggleBreakpoint  " 切换断点
:VimspectorContinue          " 开始/继续调试
```

## 🛠️ 自定义

### 添加新的任务
在 `tasks.ini` 中添加：
```ini
[your-task-name]
command=your-command
cwd=$(VIM_FILEDIR)
output=terminal
```

### 修改主题
在 `.vimrc` 中修改：
```vim
let g:tokyonight_style = 'storm'  " night, storm
colorscheme your-preferred-theme
```

## 🐛 故障排除

### 常见问题
1. **COC 不工作**: 确保 Node.js >= 12.12
2. **字体显示问题**: 安装 Nerd Font
3. **终端颜色问题**: 确保终端支持真彩色

### 日志查看
```vim
:CocInfo          " COC 信息
:AsyncTaskEdit    " 编辑任务配置
:messages         " Vim 消息
```

## 📄 许可证

MIT License

## 🤝 贡献

欢迎提交 Issues 和 Pull Requests！

---

**作者**: dascard  
**邮箱**: dascard601@gmail.com  
**更新日期**: 2025-05-29