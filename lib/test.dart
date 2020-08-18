import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/BodyBean.dart';
import 'dart:convert';


class TestHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("标题"),
      ),
      body: new MyBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text('返回'),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return new Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
              child: Text('应用基本信息', style: textStyle),
            ),
            new AppInfo(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 2),
              child: Text('版本信息', style: textStyle),
            ),
            /*new VersionInfo1(),*/
            new VersionInfo2(),
            new VersionInfo3(),
            new BottomInfo1(),
            new BottomInfo2(),
          ],
        ));
  }
}
class AppInfoStatue extends State<AppInfo>{
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    void showToast() async {

      try {
        Response response = await Dio().get("http://192.168.31.146:88/flutter/getBean");
        print(response);

        Map userMap = json.decode(response.toString());
        var user = new BodyBean.fromJson(userMap);
        setState(() {
          widget.bodyBean=user;
        });

      } catch (e) {
        print(e);
      }
    }
    showToast();
    // TODO: implement build
    return new Container(
        color: Color.fromARGB(255, 255, 255, 207),
        child: new Row(
          children: <Widget>[
            Container(
              child: new Icon(
                Icons.insert_photo,
                color: Colors.grey[500],
                size: 72,
              ),
              height: 120,
              width: 120,
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      widget.bodyBean.title,
                      style: textStyle,
                    ),
                  ),
                  Text(widget.bodyBean.appId),
                  Text(widget.bodyBean.packName),
                  Row(
                    children: <Widget>[
                      Text("          "),
                      FlatButton(
                        onPressed: _getBatteryLevel,
                        child: Text(
                          "前往应用市场查看",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
    /*  return */
  }
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    print(batteryLevel);
  }

}
class AppInfo extends StatefulWidget {
  AppInfo({Key key}) : super(key: key);
  var bodyBean=new BodyBean(">>",">>","...");
  @override
  AppInfoStatue createState() => AppInfoStatue();
}

class VersionInfo1 extends State<AppInfo> {

  void setBean(){
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return new Container(
      color: Color.fromARGB(255, 255, 255, 207),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '版本号',
                style: textStyle,
              ),
              InkWell(child:  Row(
                children: <Widget>[
                  Container(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: new Icon(
                          Icons.lens,
                          color: Colors.red[500],
                          size: 24,
                        )),
                    height: 40,
                    width: 40,
                  ),
                  Container(width: 80, child: Text("新版本")),
                  Text("应用待修改"),
                ],
              ),),

            ]),
      ),
    );
  }
}

class VersionInfo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return new Container(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: Container(
        color: Color.fromARGB(255, 255, 255, 207),
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '版本号',
                style: textStyle,
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: new Icon(
                          Icons.lens,
                          color: Colors.red[500],
                          size: 24,
                        )),
                    height: 40,
                    width: 40,
                  ),
                  Container(width: 80, child: Text("已上架")),
                  Text("上架时间 2020 08-09 12:37:00"),
                ],
              )
            ]),
      ),
    );
  }
}

class VersionInfo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return new Container(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: Container(
        color: Color.fromARGB(255, 255, 255, 207),
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '版本号',
                style: textStyle,
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: new Icon(
                          Icons.lens,
                          color: Colors.red[500],
                          size: 24,
                        )),
                    height: 40,
                    width: 40,
                  ),
                  Container(width: 80, child: Text("准备提交")),
                ],
              )
            ]),
      ),
    );
  }
}

class BottomInfo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _incrementCounter() {
      Navigator.pop(context);
    }
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return new Container(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: InkWell(
        child: new Row(
          children: [
            new Expanded(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    '分析',
                    style: textStyle,
                  )
                ),
              ],
            )),
            new Icon(
              Icons.keyboard_arrow_right,
              color: Colors.red[500],
              size: 36,
            )
          ],
        ),
        onTap: _incrementCounter,
      ),
    );
    //...
  }
}

class BottomInfo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    void getHttp() async {
      try {
        Response response = await Dio().get("http://www.baidu.com");
        print(response);
      } catch (e) {
        print(e);
      }
    }
    return new Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: InkWell(
        child: new Row(
          children: [
            new Expanded(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    '评论',
                    style: textStyle,
                  )
                ),
              ],
            )),
            new Icon(
              Icons.keyboard_arrow_right,
              color: Colors.red[500],
              size: 36,
            )
          ],
        ),
        onTap: getHttp,
      ),
    );
    //...
  }
}
