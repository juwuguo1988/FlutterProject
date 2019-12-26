/**
 * 药品数据模型
 */
////

class BaseMedicPlanResponse {
  String status;
  MedicPLanData data;

  BaseMedicPlanResponse({this.status, this.data});

  BaseMedicPlanResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new MedicPLanData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class MedicPLanData {
  List<PlanBean> plans;

  MedicPLanData({this.plans});

  MedicPLanData.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = new List<PlanBean>();
      json['plans'].forEach((v) {
        plans.add(new PlanBean.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plans != null) {
      data['plans'] = this.plans.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlanBean {
  String id;
  int takeAt;
  String medicineId;
  String medicineName;
  String category;
  String medicineHash;
  int medicineVia;
  int count;
  int dosage;
  int cycleDays;
  int zone;
  int positionNo;
  String dosageUnit;
  int started;
  int ended;
  int remindFirstAt;
  String boxUuid;
  int planSeqWithBox;
  String dosageFormUnit;
  String commodityName;
  String ingredient;
  String isUnknown;
  List<dynamic> imageId;

  PlanBean(
      {this.id,
      this.takeAt,
      this.medicineId,
      this.medicineName,
      this.category,
      this.medicineHash,
      this.medicineVia,
      this.count,
      this.dosage,
      this.cycleDays,
      this.zone,
      this.positionNo,
      this.dosageUnit,
      this.started,
      this.ended,
      this.remindFirstAt,
      this.boxUuid,
      this.planSeqWithBox,
      this.dosageFormUnit,
      this.commodityName,
      this.ingredient,
      this.isUnknown,
      this.imageId});

  PlanBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    takeAt = json['takeAt'];
    medicineId = json['medicineId'];
    medicineName = json['medicineName'];
    category = json['category'];
    medicineHash = json['medicineHash'];
    medicineVia = json['medicineVia'];
    count = json['count'];
    dosage = json['dosage'];
    cycleDays = json['cycleDays'];
    zone = json['zone'];
    positionNo = json['positionNo'];
    dosageUnit = json['dosageUnit'];
    started = json['started'];
    ended = json['ended'];
    remindFirstAt = json['remindFirstAt'];
    boxUuid = json['boxUuid'];
    planSeqWithBox = json['planSeqWithBox'];
    dosageFormUnit = json['dosageFormUnit'];
    commodityName = json['commodityName'];
    ingredient = json['ingredient'];
    isUnknown = json['isUnknown'];
    imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['takeAt'] = this.takeAt;
    data['medicineId'] = this.medicineId;
    data['medicineName'] = this.medicineName;
    data['category'] = this.category;
    data['medicineHash'] = this.medicineHash;
    data['medicineVia'] = this.medicineVia;
    data['count'] = this.count;
    data['dosage'] = this.dosage;
    data['cycleDays'] = this.cycleDays;
    data['zone'] = this.zone;
    data['positionNo'] = this.positionNo;
    data['dosageUnit'] = this.dosageUnit;
    data['started'] = this.started;
    data['ended'] = this.ended;
    data['remindFirstAt'] = this.remindFirstAt;
    data['boxUuid'] = this.boxUuid;
    data['planSeqWithBox'] = this.planSeqWithBox;
    data['dosageFormUnit'] = this.dosageFormUnit;
    data['commodityName'] = this.commodityName;
    data['ingredient'] = this.ingredient;
    data['isUnknown'] = this.isUnknown;
    data['imageId'] = this.imageId;
    return data;
  }
}
