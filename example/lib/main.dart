import 'package:flutter/material.dart';
import 'package:flutter_mosaic/flutter_mosaic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  double _value = 5.0;

  void _onChanged(double newValue) {
    setState(() {
      _value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: <Widget>[
            Center(
              child: Mosaic(
                value: _value,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    // Image.asset('assets/images/hi.gif'),
                    Mosaic(
                      value: _value,
                      child: Image.asset('assets/images/hi.gif'),
                    ),
                  ],
                ),
                Mosaic(
                  value: _value,
                  child: Image.asset('assets/images/hi.png'),
                ),
              ],
            ),
            Mosaic(
              value: _value,
              child: const Text(
                'You have pushed the button this many times:',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Mosaic(
              value: _value,
              child: Text(
                '$_value',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '$_value',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: _value,
              onChanged: _onChanged,
              min: 0,
              max: 50,
            ),
          ],
        ),
      ),
    );
  }
}
