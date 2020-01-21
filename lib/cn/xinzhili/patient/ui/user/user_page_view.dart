import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xinzhili/patient/ui/setting/user_setting_view.dart';
import 'package:flutter_app/cn/xinzhili/patient/utils/config/APPConstant.dart';
import 'package:flutter_app/cn/xinzhili/patient/utils/dialog/dialog_view.dart';

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
            new GestureDetector(
              onTap: () {
                print("======点击设备管理========");
                // 使用 Navigator 跳转页面
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return UserSettingView();
                }));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image:
                    AssetImage(APPConstant.ASSETS_IMG + 'ic_devices.png'),
                    width: 20,
                    height: 20,
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(10.0),
                    child: new Text("设备管理"),
                  )
                ],
              ),
            ),
            Divider(
              height: 20.0,
              indent: 0.0,
              color: Colors.blue,
            ),
            new GestureDetector(
              onTap: () {
                print("======点击客服========");
                showAlertDialog(context);
              },
              child: Row(
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
    return Scaffold(
      appBar: AppBar(
        title: Text("我的积分"),
      ),
    );
  }
}

Future _openAlertDialog(context) async {
  await showDialog(
    context: context,
    barrierDismissible: false, //// user must tap button!
    builder: (BuildContext context) {
      return MyAlertDialog();
    },
  );
}

void showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("客服电话:110110119"),
          title: Center(
            child: Text(
              '客服电话',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text(
                  '拨打'
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text(
                  '取消'
              ),
            )
          ],
        );
      });
}