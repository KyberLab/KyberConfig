# KyberConfig 配置

本目录包含 KyberLab 项目所需的配置文件，不同的开发板使用同名的对应分支。


## 配置文件说明

### Default.mk
- 构建平台配置：`BUILD_PLATFORM`、`BUILD_BOARD`
- 构建类型配置：`BUILD_TYPE_NUM`、`BUILD_TYPE_STR`、`BUILD_VARIANT`
- 镜像列表配置：`IMAGE_BUILD_LIST`、`IMAGE_DEPEND_LIST`

### Network.mk
- 仓库URL配置：`REPO_URL_IP`、`REPO_URL_PROTO`、`REPO_URL_BASE`
- 仓库基础路径：`REPO_URL_GIT_BASE`

### Repo.mk
- 各镜像的仓库地址和分支配置
- 支持的镜像：U-Boot、Linux、BusyBox、BuildRoot、Emu、Qemu
- 开发版和发布版分支配置

## 使用方法

这些配置文件由主项目的 Makefile 自动加载和使用。详细使用方法请参阅主项目文档。

## 许可证

本项目采用 Apache License 2.0 许可证。详见 [LICENSE](./LICENSE) 文件。
