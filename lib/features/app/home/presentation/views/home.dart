import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/date_of_day.dart';
import '../manger/home_cubit/home_cubit.dart';
import 'widgets/body.dart';
import 'widgets/drawer/drawer_widgets.dart';

class NewHome extends StatelessWidget {
  const NewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getName(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const DateOfDay(),
          ),
          drawer: const DrawerWidgets(),
          body: const NewHomeBody(),
        ),
      ),
    );
  }
}
