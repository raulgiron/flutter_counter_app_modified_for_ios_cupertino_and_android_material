import 'package:flutter/cupertino.dart';
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
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
      home: MyHomePage(title: "Raul's learning Flutter!"),
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeBlue.withOpacity(0.80),
        middle: Text(
          widget.title,
          style: const TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: CupertinoColors.activeBlue.withOpacity(0.13),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Image.asset(
                './images/flutter_logo_1080.png',
                width: 100.0,
              ),
            ),
            const Text(
              'You have pushed the + button this many times:',
            ),
            Text(
              '$_counter',
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(color: CupertinoColors.activeBlue),
            ),
            const SizedBox(height: 16),
            Positioned.fill(
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CupertinoButton(
                    onPressed: _resetDisabled ? null : _decrementCounter,
                    padding: EdgeInsets.zero,
                    child: const Icon(CupertinoIcons.minus),
                  ),
                  CupertinoButton(
                    onPressed: _resetDisabled ? null : _resetCounter,
                    padding: EdgeInsets.zero,
                    child: const Icon(CupertinoIcons.refresh),
                  ),
                  CupertinoButton(
                    onPressed: _incrementCounter,
                    padding: EdgeInsets.zero,
                    child: const Icon(CupertinoIcons.plus),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
