import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        hintColor: Colors.transparent,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new MyStatelessWidget(),
/*            new ListView(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.map),
                  title: new Text("data")
                )
              ],
            ),*/
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text('页面跳转'),
                subtitle: Text('测试页面跳转功能'),
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    elevation: 0,
                    hoverElevation: 4,
                    highlightElevation: 4,
                    child: const Text('跳转'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new TestHome()),
                      );
                    },
                  ),
                   getOutlineButton(context),
                  /*   FlatButton(
                    child: const Text('跳转'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new TestHome()),
                      );
                    },
                  ),*/
                  FlatButton(
                    child: const Text('跳转'),
                    // 按下的背景色
                    splashColor: Colors.green,
                    // 水波纹颜色

                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new TestHome()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      padding: EdgeInsets.all(16.0),
    );
  }
}

Widget getOutlineButton(BuildContext context) {
  return OutlineButton(
    onPressed: () {

    },
    child: Text("OutlineButton"),
//      onHighlightChanged: onHighlightChanged,
    textTheme: ButtonTextTheme.accent,
    textColor: Colors.blueAccent,
    disabledTextColor: Colors.red,
    color: Color(0xFF2962FF),
//      disabledColor: Colors.grey,
    highlightColor: Color(0xFF2962FF),
    // 按下的背景色
    splashColor: Colors.transparent,
    // 水波纹颜色
//      colorBrightness: Brightness.light,   // 主题
//      elevation: 10,
    highlightElevation: 0,
//      disabledElevation: 10,
    padding: EdgeInsets.all(10),
    borderSide:new BorderSide(color: Colors.transparent),
//       RaisedButton 才起效
/*    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        side: BorderSide(
            color: Colors.transparent, style: BorderStyle.none, width: 0)),*/

    clipBehavior: Clip.antiAlias,
//      materialTapTargetSize: MaterialTapTargetSize.padded,
//      animationDuration: Duration(seconds:1),
//      minWidth: 200,
//      height: 50,
  );
}
