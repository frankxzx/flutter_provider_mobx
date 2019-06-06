import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_provide_mobx_demo/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<Counter>(
        builder: (_) => Counter(233),
      ),
      Provider<Counter>(
        builder: (_) => Counter(666),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final shareCounter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (_) => Page1())
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () async {
              shareCounter.increment();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () async {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => Page2()),
              );
            },
            tooltip: 'push',
            child: Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countStore = Provider.of<Counter>(context);
    return Observer(
        builder: (_) => Container(child: Text('${countStore.value}')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countStore = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Container(
        child: Observer(
            builder: (_) => Container(child: Text('${countStore.value}'))),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () async {
              countStore.increment();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () async {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => Page2()),
              );
            },
            tooltip: 'push',
            child: Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
