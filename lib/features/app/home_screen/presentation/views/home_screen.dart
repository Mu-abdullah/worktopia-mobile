import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/date_of_day.dart';
import '../manger/home_cubit/home_cubit.dart';
import 'widgets/drawer/drawer_widgets.dart';
import 'widgets/floating_button.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit()
            ..fetchActiveCompanies()
            ..getName(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const DateOfDay(),
          ),
          floatingActionButton: const FloatingButton(),
          drawer: const DrawerWidgets(),
          body: const HomeScreenBody(),
        ),
      ),
    );
  }
}
