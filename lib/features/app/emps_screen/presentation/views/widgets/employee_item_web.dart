import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:worktopia/core/utils/colors.dart';
import 'package:worktopia/core/widgets/default_texts.dart';

import '../../../../../../core/entities/department_model.dart';
import '../../../../../../core/entities/emoloyees_model.dart';
import '../../../../../../core/helper/firebase_names.dart';
import '../../../../../../core/utils/constant.dart';
import 'emp_details_screen.dart';

class WebEmployeeItem extends StatefulWidget {
  const WebEmployeeItem({
    super.key,
    required this.emp,
    required this.departmentModel,
    required this.constraints,
  });
  final EmployeesModel emp;
  final BoxConstraints constraints;
  final String departmentModel;

  @override
  State<WebEmployeeItem> createState() => _WebEmployeeItemState();
}

class _WebEmployeeItemState extends State<WebEmployeeItem> {
  late DepartmentsModel department;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection(FBFirestoreName.departmentCollection)
                .doc(widget.departmentModel)
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmpDetailsScreen(
                  model: widget.emp,
                  departmentsModel: department,
                ),
              ),
            );
          },
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: widget.constraints.maxWidth == Constant.mobileWidth
                          ? 50
                          : 100,
                      height:
                          widget.constraints.maxWidth == Constant.mobileWidth
                              ? 50
                              : 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.emp.empImage!),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColor.redColor)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TitleText(text: widget.emp.empName!),
                  TitleText(
                    text: widget.emp.scoop!,
                    isTitle: false,
                    subTitleColor: AppColor.blackColor.withOpacity(.5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
