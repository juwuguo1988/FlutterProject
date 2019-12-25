import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xinzhili/patient/service/http_service.dart';
import 'package:flutter_app/cn/xinzhili/patient/model/medic_plan_model.dart';

class MedicPlanListUI extends StatefulWidget {
  _MedicPlanListUIState createState() => _MedicPlanListUIState();
}

class _MedicPlanListUIState extends State<MedicPlanListUI> {
  BaseMedicPlanResponse mBaseMedicPlanResponse;
  var scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllMedicPlan();
  }

  void getAllMedicPlan() async {
    var url = "https://api.test.xzlcorp.com/v0/patient/plan";
    await request(url).then((onValue) {
      var dataJson = json.decode(onValue);
      print("请求到的数据:" + dataJson);
      setState(() {
        //将返回的json数据转换成model
        mBaseMedicPlanResponse = BaseMedicPlanResponse.fromJson(onValue);
      });
    });
  }

  //药品列表
  Widget _MedicPlanListWidget(List newList, int index) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.black))),
      //水平方向
      child: Row(
        children: <Widget>[
          _MedicPlanContent(newList[index].medicineName),
          _MedicPlanContent(newList[index].count),
          _MedicPlanContent(newList[index].dosage),
          _MedicPlanContent(newList[index].cycleDays),
        ],
      ),);
  }

  Widget _MedicPlanContent(String content) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 200,
      child: Text(content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 18),),
    );
  }


  @override
  Widget build(BuildContext context) {
    if (mBaseMedicPlanResponse.data.plans.isNotEmpty) {
      return ListView.builder(
        controller: scrollController,
        itemCount: mBaseMedicPlanResponse.data.plans.length,
        itemBuilder: (context,index){
          return _MedicPlanListWidget(mBaseMedicPlanResponse.data.plans,index);
        },
      );
    }
    //没有数据返回空容器
    return Container();
  }
}
