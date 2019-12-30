import 'dart:convert' as Convert;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xinzhili/patient/service/http_service.dart';
import 'package:flutter_app/cn/xinzhili/patient/model/medic_plan_model.dart';

class MedicPlanViewUI extends StatefulWidget {
  _MedicPlanListUIState createState() => _MedicPlanListUIState();
}

class _MedicPlanListUIState extends State<MedicPlanViewUI> {
  BaseMedicPlanResponse mBaseMedicPlanResponse;
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getAllMedicPlan();
  }

  void getAllMedicPlan() async {
    var url = "https://api.xinzhili.cn/v0/patient/plan";
    await request(url).then((onValue) {
      if (onValue != null) {
        print("请求到的数据:" + onValue.toString());
        // var dataJson = json.decode(onValue.body);
        var dataJson = Convert.jsonDecode(onValue);
        if (mounted) {
          setState(() {
            //将返回的json数据转换成model
            mBaseMedicPlanResponse = BaseMedicPlanResponse.fromJson(dataJson);
          });
        }
      }
    });
  }

  //药品列表
  Widget _medicPlanListWidget(List newList, int index) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.black))),
      //水平方向
      child: Row(
        children: <Widget>[
          Flexible(
              child:
                  Card(child: _medicPlanContent(newList[index].medicineName))),
          Flexible(
              child: Card(
                  child: _medicPlanContent(newList[index].count.toString()))),
          Flexible(
              child: Card(
                  child: _medicPlanContent(newList[index].dosage.toString()))),
          Flexible(
              child:
                  Card(child: _medicPlanContent(newList[index].dosageFormUnit)))
        ],
      ),
    );
  }

  Widget _medicPlanContent(String content) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 200,
      child: Text(
        content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (mBaseMedicPlanResponse != null) {
      if (mBaseMedicPlanResponse.data != null) {
        if (mBaseMedicPlanResponse.data.plans.isNotEmpty) {
          return Container(
            height: 300.0,
            padding: padding(),
            color: Color(0xFFEFEFEF),
            child: ListView.builder(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: mBaseMedicPlanResponse.data.plans.length,
              itemBuilder: (context, index) {
                return _medicPlanListWidget(
                    mBaseMedicPlanResponse.data.plans, index);
              },
            ),
          );
        }
      }
    }
    //没有数据返回空容器
    return Container();
  }

  padding() {
    return EdgeInsets.only(left: 12, right: 12);
  }
}
