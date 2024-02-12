import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/size.dart';
import '../../../../../../core/utils/tables_name.dart';
import '../../../data/model/department_button_model.dart';
import 'department_item.dart';

class DepartmentListView extends StatelessWidget {
  DepartmentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: CustomSize.height(context, .2),
        child:  ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return DepartmentItem(
              model: kIsWeb ? webItems[index] : items[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
        ));
  }

  final List<DepartmentsButtonModel> items = [
    DepartmentsButtonModel(
        departmentName: TableName.supplyEmp, departmentIcon: Iconsax.people),
    DepartmentsButtonModel(
        departmentName: TableName.buffet, departmentIcon: Iconsax.coffee),
    DepartmentsButtonModel(
        departmentName: TableName.clean, departmentIcon: Iconsax.broom),
    DepartmentsButtonModel(
        departmentName: TableName.farm, departmentIcon: Iconsax.tree),
    DepartmentsButtonModel(
        departmentName: TableName.reeds, departmentIcon: Icons.grass_outlined),
  ];
  final List<DepartmentsButtonModel> webItems = [
    DepartmentsButtonModel(
        departmentName: TableName.supplyEmp, departmentIcon: Icons.people_outlined),
    DepartmentsButtonModel(
        departmentName: TableName.buffet, departmentIcon: Icons.coffee_outlined),
    DepartmentsButtonModel(
        departmentName: TableName.clean, departmentIcon: Icons.clean_hands),
    DepartmentsButtonModel(
        departmentName: TableName.farm, departmentIcon: Icons.agriculture_outlined),
    DepartmentsButtonModel(
        departmentName: TableName.reeds, departmentIcon: Icons.grass_outlined),
  ];
}
