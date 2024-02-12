import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/utils/app_routs.dart';
import '../../../../../../new_screens/new_company/presentation/views/add_new_company.dart';
import '../../../../data/model/drawer_model.dart';
import 'drawer_item.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<DrawerModel> drawerButton = items(context);
    return Expanded(
      child: ListView.builder(
        itemCount: drawerButton.length,
        itemBuilder: (context, index) {
          return DrawerListViewItem(
            model: drawerButton[index],
          );
        },
      ),
    );
  }

  List<DrawerModel> items(BuildContext context) {
    return [
      DrawerModel(
        buttonName: "اضافة عامل",
        leading: kIsWeb ? Icons.person_outline : Iconsax.user,
        trailing: Icons.arrow_forward_ios_rounded,
        onTap: () {
          Navigator.pop(context);
          GoRouter.of(context).push(AppRouter.newEmpScreen);
        },
      ),
      DrawerModel(
        buttonName: "اضافة شركة جديدة",
        leading: kIsWeb ? Icons.house_outlined : Iconsax.house,
        trailing: Icons.arrow_forward_ios_rounded,
        onTap: () {
          Navigator.pop(context);
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            isScrollControlled: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (context) => const NewCompanyBottomSheet(),
          );
        },
      ),
      // DrawerModel(
      //   buttonName: "اضافة قسم جديد",
      //   leading: kIsWeb ? Icons.category_outlined : Iconsax.category,
      //   trailing: Icons.arrow_forward_ios_rounded,
      //   onTap: () {
      //     Navigator.pop(context);
      //     GoRouter.of(context).push(AppRouter.departmentScreen);
      //   },
      // ),
    ];
  }
}
