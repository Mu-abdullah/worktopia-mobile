import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../manger/home_cubit/home_cubit.dart';
import '../../manger/home_cubit/home_state.dart';
import 'company_item.dart';

class CompanyListview extends StatelessWidget {
  const CompanyListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SuccessGetCompanies) {
          return SizedBox(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.departments.length,
              itemBuilder: (context, index) => CompanyItem(
                model: state.departments[index],
              ),
            ),
          );
        }
        if (state is FailedGetCompanies) {
          return TitleText(
            text: "يوجد خطأ في تحميل البيانات: ${state.error}",
            maxLine: 5,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.yellowColor,
            ),
          );
        }
      },
    );
  }
}
