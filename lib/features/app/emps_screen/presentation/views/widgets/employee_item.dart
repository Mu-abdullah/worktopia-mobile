import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/entites/department_model.dart';
import '../../../../../../core/entites/emoloyees_model.dart';
import '../../../../../../core/helper/firebase_names.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/tables_name.dart';
import '../../../../../../core/widgets/default_texts.dart';
import 'emp_bottom_sheet.dart';

class EmployeeItem extends StatefulWidget {
  const EmployeeItem({
    super.key,
    required this.emp,
    required this.scoop,
  });
  final EmpsModels emp;
  final String scoop;

  @override
  State<EmployeeItem> createState() => _EmployeeItemState();
}

class _EmployeeItemState extends State<EmployeeItem> {
  late DepartmentsModel department;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection(FBFirestoreName.departmentCollection)
                  .doc(collectionID())
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  department =
                      DepartmentsModel.fromDocumentSnapshot(snapshot.data!);
                  return const SizedBox();
                }
                if (snapshot.hasError) {
                  return const TitleText(text: "يوجد مشكلة في تحميل البيانات");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: TitleText(text: "جاري تحميل البيانات"));
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                isScrollControlled: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                builder: (context) => EmpBottomSheet(
                  model: widget.emp,
                  departmentsModel: department,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: ListTile(
                title: TitleText(text: widget.emp.empName!),
                leading: CircleAvatar(
                  maxRadius: 30,
                  minRadius: 30,
                  backgroundImage: NetworkImage(widget.emp.empImage!),
                ),
                subtitle: Align(
                  alignment: Alignment.bottomLeft,
                  child: TitleText(
                    isTitle: false,
                    text: widget.emp.scoop!,
                    subTitleColor: AppColor.blackColor.withOpacity(.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String collectionID() {
    if (widget.scoop == TableName.supplyEmp) {
      return FBFirestoreName.dDocumentSupplyEmp;
    }
    if (widget.scoop == TableName.buffet) {
      return FBFirestoreName.dDocumentBuffet;
    }
    if (widget.scoop == TableName.clean) {
      return FBFirestoreName.dDocumentClean;
    }
    if (widget.scoop == TableName.farm) {
      return FBFirestoreName.dDocumentZra3a;
    } else {
      return FBFirestoreName.dDocumentAntiReed;
    }
  }
}
