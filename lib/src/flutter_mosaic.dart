import 'package:flutter/widgets.dart';

import 'package:flutter_shaders/flutter_shaders.dart';

class Mosaic extends StatelessWidget {
  const Mosaic({super.key, required this.child, required this.value});

  final Widget child;
  final double value;

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      (context, shader, child) {
        return AnimatedSampler(
          (image, size, canvas) {
            shader.setFloatUniforms((uniforms) {
              uniforms
                ..setFloats([value, value])
                ..setFloat(2.0)
                ..setSize(size);
            });

            shader.setImageSampler(0, image);

            canvas.drawRect(
              Rect.fromLTWH(0, 0, size.width, size.height),
              Paint()..shader = shader,
            );
          },
          child: child ?? const SizedBox(),
        );
      },
      assetKey: 'packages/flutter_mosaic/shaders/mosaic.frag',
      child: child,
    );
  }
}
