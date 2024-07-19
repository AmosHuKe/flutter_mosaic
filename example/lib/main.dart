// Example: https://github.com/AmosHuKe/flutter_mosaic/tree/main/example
import 'package:flutter/material.dart';
import 'package:flutter_mosaic/flutter_mosaic.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mosaic Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Demo(title: 'Flutter Mosaic Demo'),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({super.key, required this.title});

  final String title;

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  static const toolTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  double mosaicWidth = 5.0;
  double mosaicHeight = 5.0;
  bool lock = true;
  SampleCount sampleCount = SampleCount.s4;

  void onChangedMosaicWidth(double newValue) {
    if (lock) {
      mosaicHeight = newValue;
      mosaicWidth = mosaicHeight;
    } else {
      mosaicWidth = newValue;
    }
    setState(() {});
  }

  void onChangedMosaicHeight(double newValue) {
    if (lock) {
      mosaicWidth = newValue;
      mosaicHeight = mosaicWidth;
    } else {
      mosaicHeight = newValue;
    }
    setState(() {});
  }

  void onChangedMosaicSampleCount(SampleCount? newValue) {
    if (newValue == null) return;
    setState(() {
      sampleCount = newValue;
    });
  }

  List<Widget> buildSampleCountWidget() {
    List<Widget> widgets = [];
    for (SampleCount item in SampleCount.values) {
      widgets.add(
        FilterChip(
          label: Text(item.name),
          selected: sampleCount == item,
          onSelected: (_) => onChangedMosaicSampleCount(item),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: ListView(
                    children: [
                      /// Mosaic Demo
                      Mosaic(
                        mosaicSize: Size(mosaicWidth, mosaicHeight),
                        sampleCount: sampleCount,
                        child: Column(
                          children: [
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                SizedBox(
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
                                Image.asset('assets/images/hi.gif'),
                                Image.asset('assets/images/hi.png'),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Flutter Mosaic Flutter Mosaic\nWidth: $mosaicWidth, Height: $mosaicHeight',
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// Tools
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                /// Width, Height
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text('Lock: ', style: toolTextStyle),
                          Checkbox(
                            value: lock,
                            onChanged: (value) {
                              lock = value ?? true;
                              if (lock) mosaicHeight = mosaicWidth;
                              setState(() {});
                            },
                          ),
                        ],
                      ),

                      /// Width
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Width: ${mosaicWidth.toStringAsFixed(4)}',
                            style: toolTextStyle,
                          ),
                          Slider(
                            value: mosaicWidth,
                            onChanged: onChangedMosaicWidth,
                            min: 0,
                            max: 50,
                          ),
                        ],
                      ),

                      /// Height
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Height: ${mosaicHeight.toStringAsFixed(4)}',
                            style: toolTextStyle,
                          ),
                          Slider(
                            value: mosaicHeight,
                            onChanged: onChangedMosaicHeight,
                            min: 0,
                            max: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Sample Count
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SampleCount: ${sampleCount.name}',
                        style: toolTextStyle,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: buildSampleCountWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
