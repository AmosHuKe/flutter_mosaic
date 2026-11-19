import 'package:flutter/widgets.dart';
import 'package:flutter_mosaic/flutter_mosaic.dart';

class MosaicTestWidget extends StatelessWidget {
  const MosaicTestWidget({
    super.key,
    this.enabled = true,
    required this.mosaicSize,
    this.sampleCount = SampleCount.s4,
  });

  final bool enabled;
  final Size mosaicSize;
  final SampleCount sampleCount;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(
        size: Size(800, 600),
        devicePixelRatio: 3.0,
      ),
      child: ColoredBox(
        color: const Color(0xFFFFFFFF),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: Mosaic(
              key: const Key('MosaicWidget'),
              enabled: enabled,
              mosaicSize: mosaicSize,
              sampleCount: sampleCount,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: const Color(0xFFF44336),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: const Color(0xFF2196F3),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: const Color(0xFFFFEB3B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
