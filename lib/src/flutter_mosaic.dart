import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

import 'package:flutter_shaders/flutter_shaders.dart';

import 'enums.dart';

/// Mosaic
/// 马赛克
class Mosaic extends StatelessWidget {
  /// Mosaic
  /// 马赛克
  ///
  /// - [enabled]       Enable mosaic.
  /// - [mosaicSize]    Each mosaic block size.
  /// - [sampleCount]   Number of samples in each mosaic block.
  /// - [child]         Target widget (apply mosaic).
  ///
  /// ------
  ///
  /// - [enabled]       启用马赛克。
  /// - [mosaicSize]    每个马赛克块的尺寸。
  /// - [sampleCount]   每个马赛克块的采样数量。
  /// - [child]         目标 widget（应用马赛克）。
  ///
  const Mosaic({
    super.key,
    this.enabled = true,
    required this.mosaicSize,
    this.sampleCount = SampleCount.s4,
    required this.child,
  });

  /// Enable mosaic
  /// 启用马赛克
  final bool enabled;

  /// Mosaic Size
  /// 马赛克尺寸
  final Size mosaicSize;

  /// Sample Count
  /// 采样数量
  final SampleCount sampleCount;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      (BuildContext context, FragmentShader shader, Widget? child) {
        return AnimatedSampler(
          (ui.Image image, Size size, ui.Canvas canvas) {
            shader.setFloatUniforms((UniformsSetter uniforms) {
              uniforms
                // uMosaicSize
                ..setFloats([mosaicSize.width, mosaicSize.height])
                // uSampleCount
                ..setFloat(sampleCount.count)
                // uSize
                ..setSize(size);
            });

            /// uTexture
            shader.setImageSampler(0, image);

            canvas.drawRect(
              Rect.fromLTWH(0, 0, size.width, size.height),
              Paint()..shader = shader,
            );
          },
          enabled: enabled && !mosaicSize.isEmpty,
          child: child ?? const SizedBox(),
        );
      },
      assetKey: 'packages/flutter_mosaic/shaders/mosaic.frag',
      child: child,
    );
  }
}
