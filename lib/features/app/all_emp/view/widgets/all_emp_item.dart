import 'package:flutter/material.dart';
import 'package:worktopia/core/entites/department_model.dart';

import '../../../../../core/entites/emoloyees_model.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../../core/widgets/default_texts.dart';

class AllEmpItem extends StatelessWidget {
  const AllEmpItem({
    super.key,
    required this.emp,
    // required this.department,
  });
  final EmployeesModel emp;
  // final DepartmentsModel department;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showAlertDialog(context, emp);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ListTile(
            title: TitleText(text: emp.empName!),
            subtitle: Row(
              children: [
                TitleText(
                  text: emp.empId!,
                  isTitle: false,
                  subTitleColor: AppColor.blackColor.withOpacity(0.5),
                ),
                const SizedBox(width: 10),
                TitleText(
                  text: emp.scoop!,
                  isTitle: false,
                  subTitleColor: AppColor.blackColor.withOpacity(0.5),
                ),
                // TitleText(
                //   text: department.empSalary!,
                //   isTitle: false,
                //   subTitleColor: AppColor.blackColor.withOpacity(0.5),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context, EmployeesModel emp) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 60,
                  minRadius: 40,
                  backgroundColor: AppColor.navyColor,
                  child: CircleAvatar(
                    maxRadius: 55,
                    minRadius: 40,
                    backgroundImage: NetworkImage(
                      emp.empImage!,
                    ),
                  ),
                ),
                TitleText(
                  text: emp.empName!,
                  maxLine: 2,
                ),
              ],
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TitleText(isTitle: false, text: "رقم القيد: ${emp.empId!}"),
                TitleText(isTitle: false, text: "التخصص: ${emp.scoop!}"),
                TitleText(isTitle: false, text: "الرقم القومي: ${emp.empNId!}"),
                TitleText(
                    isTitle: false, text: "رقم الهاتف: ${emp.empPhoneNumber!}"),
                TitleText(
                    isTitle: false,
                    text: "العنوان: ${emp.empAddress!}",
                    maxLine: 3),
                TitleText(
                    isTitle: false, text: "بداية العمل: ${emp.startJob!}"),
                TitleText(
                    isTitle: false,
                    text: "حالة العمل:${jobStatus(model: emp.jobStatus!)}"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: const TitleText(
                  isTitle: false, subTitleColor: Colors.blue, text: 'اغلاق'),
            ),
          ],
        );
      },
    );
  }
}
// 