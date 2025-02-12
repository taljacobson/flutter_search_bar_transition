import 'package:flutter/material.dart';
import 'package:reveal_search_bar/RevealSearchBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Search Bar Transition Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.amber),
        ),
        home: MyHomePage(title: 'Flutter Search Bar Transition Example'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late TextEditingController controller;
  bool isRTL = false;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: RevealAppBar(
          searchController: controller,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextButton(
                child: Text(isRTL ? 'rtl' : 'ltr'),
                onPressed: () {
                  setState(() {
                    isRTL = !isRTL;
                  });
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
