import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../manger/home_cubit/home_cubit.dart';
import '../../manger/home_cubit/home_state.dart';
import 'new_home_listview_item.dart';

class NewHomeListView extends StatefulWidget {
  const NewHomeListView({
    super.key,
  });
  @override
  State<NewHomeListView> createState() => _NewHomeListViewState();
}

class _NewHomeListViewState extends State<NewHomeListView> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).fetchActiveCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        if (state is SuccessGetCompanies) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TitleText(
                  text: "مرحباً، ${(cubit.name ?? "")}",
                ),
                const SizedBox(height: 10),
                const TitleText(
                  text: "العقود الحالية",
                  titleSize: 36,
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.departments.length,
                  itemBuilder: (context, index) => NewHomeListViewItem(
                    model: state.departments[index],
                  ),
                ),
              ],
            ),
          );
        }
        if (state is FailedGetCompanies) {
          return TitleText(
            text: "يوجد خطأ في تحميل البيانات: ${state.error}",
            maxLine: 5,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
