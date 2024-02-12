import 'package:cloud_firestore/cloud_firestore.dart';

class EmpsModels {
  final String? empId;
  final String? departmentId;
  late final String? empImage;
  final String? empName;
  final String? empDepartment;
  final String? scoop;
  final String? empPhoneNumber;
  final String? empNId;
  final String? empAddress;
  final String? empBankAcc;
  final String? jobStatus;
  final String? endJobReaseon;
  final String? startJob;
  final String? endJob;

  EmpsModels({
    this.empId,
    this.departmentId,
    this.empImage,
    this.empName,
    this.empDepartment,
    this.scoop,
    this.empPhoneNumber,
    this.empAddress,
    this.empNId,
    this.empBankAcc,
    this.jobStatus,
    this.endJobReaseon,
    this.startJob,
    this.endJob,
  });

  factory EmpsModels.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? json = snapshot.data() as Map<String, dynamic>?;
    return EmpsModels(
      empId: json?["empId"],
      departmentId: json?["departmentId"],
      empImage: json?["empImage"],
      empName: json?["empName"],
      empDepartment: json?["empDepartment"],
      scoop: json?["scoop"],
      empPhoneNumber: json?["empPhoneNumber"],
      empAddress: json?["empAddress"],
      empNId: json?["empNId"],
      empBankAcc: json?["empBankAcc"],
      jobStatus: json?["jobStatus"],
      endJobReaseon: json?["endJobReaseon"],
      startJob: json?["startJob"],
      endJob: json?["endJob"],
    );
  }
  Map<String, dynamic> toJson() => {
        "empId": empId,
        "departmentId": departmentId,
        "empImage": empImage,
        "empName": empName,
        "empDepartment": empDepartment,
        "scoop": scoop,
        "empPhoneNumber": empPhoneNumber,
        "empAddress": empAddress,
        "empNId": empNId,
        "empBankAcc": empBankAcc,
        "jobStatus": jobStatus,
        "endJobReaseon": endJobReaseon,
        "startJob": startJob,
        "endJob": endJob,
      };
}
