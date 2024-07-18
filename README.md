[![GitHub stars](https://img.shields.io/github/stars/amoshuke/flutter_mosaic?style=social&logo=github&logoColor=1F2328&label=stars)](https://github.com/amoshuke/flutter_mosaic)
[![Pub.dev likes](https://img.shields.io/pub/likes/flutter_mosaic?style=social&logo=flutter&logoColor=168AFD&label=likes)](https://pub.dev/packages/flutter_mosaic)

📓 Language: English | [中文](README-ZH.md)  

<br/><br/>

<h1 align="center">Flutter Mosaic</h1>

<p align="center">
  <a href="https://pub.dev/packages/flutter_mosaic"><img src="https://img.shields.io/pub/v/flutter_mosaic?color=3e4663&label=stable&logo=flutter" alt="stable package" /></a>
  <a href="https://pub.dev/packages/flutter_mosaic"><img src="https://img.shields.io/pub/v/flutter_mosaic?color=3e4663&label=dev&logo=flutter&include_prereleases" alt="dev package" /></a>
  <a href="https://pub.dev/packages/flutter_mosaic/score"><img src="https://img.shields.io/pub/points/flutter_mosaic?color=2E8B57&logo=flutter" alt="pub points" /></a>
  <a href="https://www.codefactor.io/repository/github/amoshuke/flutter_mosaic"><img src="https://img.shields.io/codefactor/grade/github/amoshuke/flutter_mosaic?color=0CAB6B&logo=codefactor" alt="CodeFactor" /></a>
  <a href="https://codecov.io/gh/amoshuke/flutter_mosaic"><img src="https://img.shields.io/codecov/c/github/amoshuke/flutter_mosaic?label=coverage&logo=codecov" alt="codecov" /></a>
  <a href="https://pub.dev/packages/flutter_mosaic"><img src="https://img.shields.io/github/languages/top/amoshuke/flutter_mosaic?color=00B4AB" alt="top language" /></a>
</p>

<p align="center">
  <strong >Easy mosaic effect for Flutter!</strong>
</p>

<br/>

<div align="center">

</div>

<br/>

## Table of contents 🪄

<sub>

- [Features](#features-)

- [Install](#install-)

  - [Versions compatibility](#versions-compatibility-)

  - [Add package](#add-package-)

- [Usage](#usage-)

  - [Mosaic](#mosaic-)

- [Contributors](#contributors-)

- [License](#license-)

</sub>

<br/>


## Features ✨  

- 👀 Shader effect
- 📦 Any widget
- 🖼️ Customize the width and height of each mosaic block
- 🎨 Customize the number of samples in each mosaic block


## Install 🎯
### Versions compatibility 🐦  

| Flutter               | 3.7.0+       | 3.10.0+ |  
| ---------             | :----------: | :-----: |  
| flutter_mosaic 0.0.1+ | ✅ (Web ❌) | ✅      |  


### Add package 📦  

Run this command with Flutter,  

```sh
$ flutter pub add flutter_mosaic
```

or add `flutter_mosaic` to `pubspec.yaml` dependencies manually.  

```yaml
dependencies:
  flutter_mosaic: ^latest_version
```


## Usage 📖  

Example: [flutter_mosaic/example][]


### Mosaic 📦  

```dart
/// Import flutter_mosaic
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

| Parameter                        | Type          | Default        | Description                             |  
| ---                              | ---           | ---            | ---                                     |  
| enabled                          | `bool`        | true           | Enable mosaic.                          |  
| mosaicSize <sup>`required`</sup> | `Size`        | -              | Each mosaic block size.                 |  
| sampleCount                      | `SampleCount` | SampleCount.s4 | Number of samples in each mosaic block. |  
| child <sup>`required`</sup>      | `Widget`      | -              | Target widget (apply mosaic).           |  


## Contributors ✨  

<!-- readme: contributors -start -->
<!-- readme: contributors -end -->


## License 📄  

[![MIT License](https://img.shields.io/badge/license-MIT-green)](https://github.com/amoshuke/flutter_mosaic/blob/main/LICENSE)  
Open sourced under the MIT license.  

© AmosHuKe


[flutter_mosaic/example]: https://github.com/amoshuke/flutter_mosaic/tree/main/example
