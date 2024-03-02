import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:worktopia/core/entities/department_model.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/constant.dart';
import '../manger/current_cubit/current_emp_cubit.dart';
import '../manger/department_cubit/department_data_cubit.dart';
import '../manger/resigned_cubit/resigned_emp_cubit.dart';
import '../manger/termination_cubit/termination_emp_cubit.dart';
import 'widgets/department_data.dart';
import 'widgets/emp/current_emp.dart';
import 'widgets/emp/resigned_emp.dart';
import 'widgets/emp/termination_emp.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({
    super.key,
    required this.departmentModel,
  });

  final DepartmentsModel departmentModel;

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  late int currentIndex;
  late List<Widget> bodyItems;
  var searchText = TextEditingController();
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    bodyItems = [
      CurrentEmp(
        docId: widget.departmentModel.departmentId!,
        companyForNow: widget.departmentModel.departmentCompanyForNow!,
        departmentName: widget.departmentModel.departmentName!,
        incective: widget.departmentModel.empsIncentive,
        salary: widget.departmentModel.empSalary,
      ),
      ResignedEmp(docId: widget.departmentModel.departmentId!),
      TerminationEmp(docId: widget.departmentModel.departmentId!),
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
              docId: widget.departmentModel.departmentId!,
            ),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              return DefaultTabController(
                length: 3,
                initialIndex: currentIndex,
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      _sliverAppBar(constraints),
                      _tabBarSliver(),
                    ];
                  },
                  body: TabBarView(
                    children: bodyItems,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  SliverPersistentHeader _tabBarSliver() {
    return SliverPersistentHeader(
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
              color: AppColor.whiteColor),
          tabs: [
            Tab(
              icon: Icon(kIsWeb ? Icons.person : Iconsax.user),
              text: "العاملين",
            ),
            Tab(
              icon: Icon(kIsWeb ? Icons.dnd_forwardslash : Iconsax.slash),
              text: "الاستقالة",
            ),
            Tab(
              icon: Icon(kIsWeb
                  ? Icons.highlight_remove_outlined
                  : Iconsax.user_remove),
              text: "الاستبعاد",
            ),
          ],
        ),
      ),
      pinned: true,
    );
  }

  SliverAppBar _sliverAppBar(BoxConstraints constraints) {
    return SliverAppBar(
      expandedHeight: constraints.maxWidth <= Constant.mobileWidth ? 130 : 100,
      floating: true,
      pinned: false,
      backgroundColor: AppColor.babyBlueColor,
      flexibleSpace: FlexibleSpaceBar(
        title: DepartmentData(
          company:
              "${widget.departmentModel.departmentName}: ${widget.departmentModel.departmentCompanyForNow!}",
        ),
      ),
    );
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
      color: AppColor.babyBlueColor,
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
