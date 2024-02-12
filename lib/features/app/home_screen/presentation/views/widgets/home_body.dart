import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/size.dart';
import '../../../../../../core/widgets/divider.dart';
import '../../../../../../generated/l10n.dart';
import 'company_listview.dart';
import 'department_listview.dart';
import 'text_with_custom_padding.dart';
import 'user_and_add_new_emp.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserAndAddNewEmpButton(),
          const SizedBox(height: 15),
          HomeTextWithCustomPadding(
            text: S.current.department,
            isTitle: true,
          ),
          const SizedBox(height: 10),
          DepartmentListView(),
          const SizedBox(height: 15),
          CustomDivider(
            endIndent: CustomSize.width(context, .25),
            indent: CustomSize.width(context, .25),
          ),
          const SizedBox(height: 15),
          HomeTextWithCustomPadding(
            text: "${S.current.companies} ${S.current.currents}",
            isTitle: true,
          ),
          const SizedBox(height: 10),
          const CompanyListview(),
          const SizedBox(height:kIsWeb?0: 70),
        ],
      ),
    );
  }
}
