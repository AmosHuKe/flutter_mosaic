[![GitHub stars](https://img.shields.io/github/stars/amoshuke/flutter_mosaic?style=social&logo=github&logoColor=1F2328&label=stars)](https://github.com/amoshuke/flutter_mosaic)
[![Pub.dev likes](https://img.shields.io/pub/likes/flutter_mosaic?style=social&logo=flutter&logoColor=168AFD&label=likes)](https://pub.dev/packages/flutter_mosaic)

📓 语言：[English](README.md) | 中文

<br/><br/>

<h1 align="center">Flutter Mosaic</h1>

<p align="center">
  <a href="https://pub.dev/packages/flutter_mosaic"><img src="https://img.shields.io/pub/v/flutter_mosaic?color=3e4663&label=%E7%A8%B3%E5%AE%9A%E7%89%88&logo=flutter" alt="stable package" /></a>
  <a href="https://pub.dev/packages/flutter_mosaic"><img src="https://img.shields.io/pub/v/flutter_mosaic?color=3e4663&label=%E5%BC%80%E5%8F%91%E7%89%88&logo=flutter&include_prereleases" alt="dev package" /></a>
  <a href="https://pub.dev/packages/flutter_mosaic/score"><img src="https://img.shields.io/pub/points/flutter_mosaic?color=2E8B57&label=%E5%88%86%E6%95%B0&logo=flutter" alt="pub points" /></a>
  <a href="https://www.codefactor.io/repository/github/amoshuke/flutter_mosaic"><img src="https://img.shields.io/codefactor/grade/github/amoshuke/flutter_mosaic?color=0CAB6B&label=%E4%BB%A3%E7%A0%81%E8%B4%A8%E9%87%8F&logo=codefactor" alt="CodeFactor" /></a>
  <a href="https://codecov.io/gh/amoshuke/flutter_mosaic"><img src="https://img.shields.io/codecov/c/github/amoshuke/flutter_mosaic?label=%E6%B5%8B%E8%AF%95%E8%A6%86%E7%9B%96&logo=codecov" alt="codecov" /></a>
  <a href="https://pub.dev/packages/flutter_mosaic"><img src="https://img.shields.io/github/languages/top/amoshuke/flutter_mosaic?color=00B4AB" alt="top language" /></a>
</p>

<p align="center">
  <strong >Flutter 的简易马赛克效果！</strong>
</p>

<br/>

<div align="center">

</div>

<br/>

## Table of contents 🪄

<sub>

- [特性](#特性-)

- [安装](#安装-)

  - [版本兼容](#版本兼容-)

  - [添加 flutter_mosaic](#添加-flutter_mosaic-)

- [使用](#使用-)

  - [Mosaic](#mosaic-)

- [贡献者](#贡献者-)

- [许可证](#许可证-)

</sub>

<br/>


## 特性 ✨  

- 👀 Shader 着色器效果
- 📦 任意 widget
- 🖼️ 自定义每个马赛克块的宽度、高度
- 🎨 自定义每个马赛克块中的采样数量


## 安装 🎯
### 版本兼容 🐦  

| Flutter               | 3.7.0+       | 3.10.0+ |  
| ---------             | :----------: | :-----: |  
| flutter_mosaic 0.0.1+ | ✅ (Web ❌) | ✅      |  


### 添加 flutter_mosaic 📦  

使用 Flutter 运行以下指令，  

```sh
$ flutter pub add flutter_mosaic
```

或手动将 `flutter_mosaic` 添加到 `pubspec.yaml` 依赖项中。  

```yaml
dependencies:
  flutter_mosaic: ^latest_version
```


## 使用 📖  

示例：[flutter_mosaic/example][]


### Mosaic 📦  

```dart
/// 导入 flutter_mosaic
import 'package:flutter_mosaic/flutter_mosaic.dart';

Mosaic(
  mosaicSize: Size(6.0, 6.0),
  child: Text(
    'Flutter Mosaic',
    style: TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
    ),
  ),
),

```

| 参数名                            | 类型          | 默认值         | 描述                         |  
| ---                              | ---           | ---            | ---                         |  
| enabled                          | `bool`        | true           | 启用马赛克。                 |  
| mosaicSize <sup>`required`</sup> | `Size`        | -              | 每个马赛克块的尺寸。          |  
| sampleCount                      | `SampleCount` | SampleCount.s4 | 每个马赛克块的采样数量。      |  
| child <sup>`required`</sup>      | `Widget`      | -              | 目标 widget（应用马赛克）。   |  


## 贡献者 ✨  

<!-- readme: contributors -start -->
<!-- readme: contributors -end -->


## 许可证 📄  

[![MIT License](https://img.shields.io/badge/license-MIT-green)](https://github.com/amoshuke/flutter_mosaic/blob/main/LICENSE)  
根据 MIT 许可证开源。 

© AmosHuKe


[flutter_mosaic/example]: https://github.com/amoshuke/flutter_mosaic/tree/main/example
