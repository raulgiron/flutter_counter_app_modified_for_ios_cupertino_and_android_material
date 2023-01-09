import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Don't allow landscape mode
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Raul's learning Flutter!"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application.
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _resetDisabled = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _resetDisabled = false;
    });
  }

  void _decrementCounter() {
    if (_counter == 0) {
      return;
    }
    setState(() {
      _counter--;
      if (_counter == 0) {
        _resetDisabled = true;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _resetDisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Image.asset(
                './images/flutter_logo_1080.png',
                width: 100.0,
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
              // style: TextStyle.headline1.copyWith(color: Colors.indigo),
            ),
            Text(
              '$_counter',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.blue),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: _resetDisabled ? null : _decrementCounter,
              tooltip: 'Decrement',
              disabledElevation: 0,
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: _resetDisabled ? null : _resetCounter,
              tooltip: 'Reset',
              disabledElevation: 0,
              child: const Icon(Icons.refresh),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
