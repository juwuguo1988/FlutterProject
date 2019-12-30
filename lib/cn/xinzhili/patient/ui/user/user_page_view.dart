import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xinzhili/patient/utils/config/APPConstant.dart';

class UserPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserViewUI();
  }
}

class _UserViewUI extends State<UserPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                print("======点击我的积分========");
                // 使用 Navigator 跳转页面
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return MyScorePage();
                }));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: AssetImage(
                        APPConstant.ASSETS_IMG + 'icon_user_credit_code.png'),
                    width: 20,
                    height: 20,
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(10.0),
                    child: new Text("我的积分"),
                  ),
                ],
              ),
            ),
            Divider(
              height: 20.0,
              indent: 0.0,
              color: Colors.blue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: AssetImage(APPConstant.ASSETS_IMG + 'ic_devices.png'),
                  width: 20,
                  height: 20,
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Text("设备管理"),
                )
              ],
            ),
            Divider(
              height: 20.0,
              indent: 0.0,
              color: Colors.blue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: AssetImage(APPConstant.ASSETS_IMG + 'ic_call.png'),
                  width: 20,
                  height: 20,
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Text("客服"),
                )
              ],
            ),
            Divider(
              height: 20.0,
              indent: 0.0,
              color: Colors.blue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: AssetImage(APPConstant.ASSETS_IMG + 'ic_setting.png'),
                  width: 20,
                  height: 20,
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Text("设置"),
                ),
              ],
            ),
            Divider(
              height: 20.0,
              indent: 0.0,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}

class MyScorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('我的积分'),
    );
  }
}
