import 'package:flutter/material.dart';

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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
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
                      color: Colors.red,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
