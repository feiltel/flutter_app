import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '应用基本信息',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          new AppBaseInfo(),
          Text('版本信息'),
          new VersionInfo1(),
          new VersionInfo2(),
          new VersionInfo3(),
          new Alanys(),
          new Comment(),
        ],
      ),
    );
  }
}

class AppBaseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 255, 255, 207),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.insert_photo,
              size: 120,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "应用名称",
                  style: TextStyle(fontSize: 20),
                ),
                Text("APP ID:1234567"),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("包名：com.example.apk"),
                ),
                Row(children: <Widget>[
                  Text(">"),
                  Text(">"),
                  Text(">"),
                ]),
                Container(
                  width: 270,
                  child: FlatButton(
                    onPressed: () {
                      /*...*/
                    },
                    child: Text(
                      "Flat Button",
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                ),
              ],
            )
          ],
        ));
  }
}

class VersionInfo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.all(10.0), child: Text(""));
  }
}

class VersionInfo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.all(10.0), child: Text(""));
  }
}

class VersionInfo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.all(10.0), child: Text(""));
  }
}

class Alanys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.all(10.0), child: Text(""));
  }
}

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.all(10.0), child: Text(""));
  }
}
