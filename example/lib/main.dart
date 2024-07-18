import 'package:flutter/material.dart';
import 'package:flutter_mosaic/flutter_mosaic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mosaic Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Mosaic Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const mosaicTextStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Lock',
                  style: toolTextStyle,
                ),
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

            /// Sample Count
            Column(
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
                  children: [
                    FilterChip(
                      label: const Text('s1'),
                      selected: sampleCount == SampleCount.s1,
                      onSelected: (_) =>
                          onChangedMosaicSampleCount(SampleCount.s1),
                    ),
                    FilterChip(
                      label: const Text('s2'),
                      selected: sampleCount == SampleCount.s2,
                      onSelected: (_) =>
                          onChangedMosaicSampleCount(SampleCount.s2),
                    ),
                    FilterChip(
                      label: const Text('s4'),
                      selected: sampleCount == SampleCount.s4,
                      onSelected: (_) =>
                          onChangedMosaicSampleCount(SampleCount.s4),
                    ),
                    FilterChip(
                      label: const Text('s8'),
                      selected: sampleCount == SampleCount.s8,
                      onSelected: (_) =>
                          onChangedMosaicSampleCount(SampleCount.s8),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// Mosaic
            Expanded(
              child: Mosaic(
                mosaicSize: Size(mosaicWidth, mosaicHeight),
                sampleCount: sampleCount,
                child: ListView(
                  children: <Widget>[
                    Center(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            // Image.asset('assets/images/hi.gif'),
                            Image.asset('assets/images/hi.gif'),
                          ],
                        ),
                        Image.asset('assets/images/hi.png'),
                      ],
                    ),
                    const Text(
                      'Flutter Mosaic Flutter Mosaic',
                      style: mosaicTextStyle,
                    ),
                    Text(
                      'Width: $mosaicWidth',
                      style: mosaicTextStyle,
                    ),
                    Text(
                      'Height: $mosaicHeight',
                      style: mosaicTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
