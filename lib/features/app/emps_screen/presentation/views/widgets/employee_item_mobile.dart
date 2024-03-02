import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/entities/department_model.dart';
import '../../../../../../core/entities/emoloyees_model.dart';
import '../../../../../../core/helper/firebase_names.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/default_texts.dart';
import 'emp_details_screen.dart';

class MobileEmployeeItem extends StatefulWidget {
  const MobileEmployeeItem({
    super.key,
    required this.emp,
    required this.departmentModel,
  });
  final EmployeesModel emp;
  final String departmentModel;

  @override
  State<MobileEmployeeItem> createState() => _MobileEmployeeItemState();
}

class _MobileEmployeeItemState extends State<MobileEmployeeItem> {
 

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
        Card(
          elevation: 5,
          child: InkWell(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: ListTile(
                title: TitleText(text: widget.emp.empName!),
                leading: CircleAvatar(
                  maxRadius: 30,
                  minRadius: 30,
                  backgroundImage: NetworkImage(widget.emp.empImage!),
                ),
                subtitle: Row(
                  children: [
                    TitleText(
                      isTitle: false,
                      text: widget.emp.empId!,
                      subTitleColor: AppColor.blackColor.withOpacity(.5),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TitleText(
                        isTitle: false,
                        text: widget.emp.scoop!,
                        subTitleColor: AppColor.blackColor.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
