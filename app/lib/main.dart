import 'package:flutter/material.dart';

// TODO: Use advanced state management method like Bloc or Riverpod.
// My gut feeling is that Bloc is solider.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'memkept',
      theme: MyTheme.light(),
      darkTheme: MyTheme.dark(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Bookmarks'),
    );
  }
}

class MyTheme {
  static ThemeData light() {
    return ThemeData.from(colorScheme: const ColorScheme.light());
  }

  static ThemeData dark() {
    return ThemeData.from(colorScheme: const ColorScheme.dark());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
