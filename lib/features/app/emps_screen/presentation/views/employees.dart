import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/helper/firebase_names.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/tables_name.dart';
import '../manger/current_cubit/current_emp_cubit.dart';
import '../manger/department_cubit/department_data_cubit.dart';
import '../manger/resigned_cubit/resigned_emp_cubit.dart';
import '../manger/termination_cubit/termination_emp_cubit.dart';
import 'widgets/department_data.dart';
import 'widgets/emp/current_emp.dart';
import 'widgets/emp/resigned_emp.dart';
import 'widgets/emp/termination_emp.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key, required this.scoop});
  final String scoop;

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  late int currentIndex;
  late List<Widget> bodyItems;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    bodyItems = [
      CurrentEmp(scoop: widget.scoop),
      ResignedEmp(scoop: widget.scoop),
      TerminationEmp(scoop: widget.scoop),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CurrentEmpCubit()),
        BlocProvider(create: (context) => ResignedEmpCubit()),
        BlocProvider(create: (context) => TerminationEmpCubit()),
        BlocProvider(
          create: (context) => DepartmentDataCubit()
            ..fetchDepartmentData(
              docId: collectionID(),
            ),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: DefaultTabController(
            length: 3,
            initialIndex: currentIndex,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: kIsWeb ? 100 : 150,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: DepartmentData(
                        scoop: widget.scoop,
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      const TabBar(
                        indicatorColor: AppColor.navyColor,
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.grey,
                        dividerColor: AppColor.navyColor,
                        labelStyle: TextStyle(
                          fontFamily: Constant.notoArabicFontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        tabs: [
                          Tab(
                              icon: Icon(kIsWeb ? Icons.person : Iconsax.user),
                              text: "العاملين"),
                          Tab(
                              icon: Icon(kIsWeb
                                  ? Icons.dnd_forwardslash
                                  : Iconsax.slash),
                              text: "الاستقالة"),
                          Tab(
                              icon: Icon(kIsWeb
                                  ? Icons.highlight_remove_outlined
                                  : Iconsax.user_remove),
                              text: "الاستبعاد"),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                children: bodyItems,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String collectionID() {
    if (widget.scoop == TableName.supplyEmp) {
      return FBFirestoreName.dDocumentSupplyEmp;
    } else if (widget.scoop == TableName.buffet) {
      return FBFirestoreName.dDocumentBuffet;
    } else if (widget.scoop == TableName.clean) {
      return FBFirestoreName.dDocumentClean;
    } else if (widget.scoop == TableName.farm) {
      return FBFirestoreName.dDocumentZra3a;
    } else {
      return FBFirestoreName.dDocumentAntiReed;
    }
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
