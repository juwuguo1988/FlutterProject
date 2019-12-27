import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xinzhili/patient/utils/config/APPConstant.dart';

class HomeViewUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewUIState();
  }
}

class _HomeViewUIState extends State<HomeViewUI>
    with SingleTickerProviderStateMixin {
  int _selectIndex = 0;
  TabController _tabController;
  List<Widget> _widget = <Widget>[
    new HomePage(),
    new MedicPage(),
    new HealthPage(),
    new UserPage(),
  ];
  List tabs = ["首页", "服药", "健康", "我的"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('心之力患者端'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              /**
                  打开抽屉菜单
                  代码中打开抽屉菜单的方法在ScaffoldState中，
                  通过Scaffold.of(context)可以获取父级最近的Scaffold 组件的State对象。
               */
              Scaffold.of(context).openDrawer();
            },
          )
        ]
      ),
      drawer: new MyDrawer(), //抽屉
      body: Center(
        child: _widget.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image(
                image: _selectIndex == 0
                    ? AssetImage(
                        APPConstant.ASSETS_IMG + 'tab_home_selected.png')
                    : AssetImage(
                        APPConstant.ASSETS_IMG + 'tab_home_normal.png'),
                width: 20,
                height: 20,
              ),
              title: Text(
                "首页",
                style: TextStyle(
                  color:
                      _selectIndex == 0 ? Color(0xFF3195FA) : Color(0xFF181818),
                ),
              )),
          BottomNavigationBarItem(
              icon: Image(
                image: _selectIndex == 1
                    ? AssetImage(
                        APPConstant.ASSETS_IMG + 'tab_medicine_selected.png')
                    : AssetImage(
                        APPConstant.ASSETS_IMG + 'tab_medicine_normal.png'),
                width: 20,
                height: 20,
              ),
              title: Text(
                "服药",
                style: TextStyle(
                  color:
                      _selectIndex == 1 ? Color(0xFF3195FA) : Color(0xFF181818),
                ),
              )),
          BottomNavigationBarItem(
              icon: Image(
                image: _selectIndex == 2
                    ? AssetImage(
                        APPConstant.ASSETS_IMG + 'tab_health_selected.png')
                    : AssetImage(
                        APPConstant.ASSETS_IMG + 'tab_health_normal.png'),
                width: 20,
                height: 20,
              ),
              title: Text(
                "健康",
                style: TextStyle(
                  color:
                      _selectIndex == 2 ? Color(0xFF3195FA) : Color(0xFF181818),
                ),
              )),
          BottomNavigationBarItem(
              icon: Image(
                image: _selectIndex == 3
                    ? AssetImage(
                        APPConstant.ASSETS_IMG + 'tab_user_selected.png')
                    : AssetImage(
                        APPConstant.ASSETS_IMG + 'tab_user_normal.png'),
                width: 20,
                height: 20,
              ),
              title: Text(
                "我的",
                style: TextStyle(
                  color:
                      _selectIndex == 3 ? Color(0xFF3195FA) : Color(0xFF181818),
                ),
              ))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectIndex,
        fixedColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/user_default_portrait_70.png",
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                  Text(
                    "个人信息",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Image.asset(
                      "assets/images/ic_mine_friend.png",
                      width: 20,
                      height: 20,
                    ),
                    title: const Text("我的亲友"),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/ic_mine_doctor.png",
                      width: 20,
                      height: 20,
                    ),
                    title: const Text("我的医生"),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/ic_mine_order.png",
                      width: 20,
                      height: 20,
                    ),
                    title: const Text("我的订单"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('HomePage, index:'),
    );
  }
}

class MedicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('MedicPage, index:'),
    );
  }
}

class HealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('HealthPage, index:'),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('UserPage, index: '),
    );
  }
}
