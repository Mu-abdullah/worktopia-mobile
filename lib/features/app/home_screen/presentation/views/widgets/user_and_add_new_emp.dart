
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../generated/l10n.dart';
import '../../manger/home_cubit/home_cubit.dart';
import '../../manger/home_cubit/home_state.dart';
import 'text_with_custom_padding.dart';

class UserAndAddNewEmpButton extends StatelessWidget {
  const UserAndAddNewEmpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Row(
          children: [
            Expanded(
              flex: 3,
              child: HomeTextWithCustomPadding(
                  text: "${S.current.helloText} , ${cubit.name??""}",
                  isTitle: true),
            ),
            const SizedBox(width: 16)
          ],
        );
      },
    );
  }
}
