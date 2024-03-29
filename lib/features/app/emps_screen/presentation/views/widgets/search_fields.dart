import 'package:flutter/material.dart';

import '../../../../../../core/utils/functions.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../manger/search_cubit/search_cubit.dart';

class SearchFields extends StatelessWidget {
  const SearchFields({
    super.key,
    required this.searchIDText,
    required this.searchEmpCubit,
    required this.searchPhoneNumberText,
    required this.searchNameText,
    required this.scoop,
  });

  final TextEditingController searchIDText;
  final SearchEmpCubit searchEmpCubit;
  final TextEditingController searchPhoneNumberText;
  final TextEditingController searchNameText;
  final String scoop;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomTextField(
                hint: "رقم القيد",
                label: "رقم القيد",
                prefix: const Icon(Icons.search_outlined),
                isPassword: false,
                type: TextInputType.number,
                controller: searchIDText,
                maxLines: 1,
                onChange: (value) {
                  searchEmpCubit.search(
                    empId: value,
                    colllectinID: collectionID(scoop),
                  );
                },
                validate: (value) {
                  if (value.isEmpty) {
                    return "ادخل رقم قيد";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              flex: 2,
              child: CustomTextField(
                hint: "رقم الهاتف",
                label: "رقم الهاتف",
                prefix: const Icon(Icons.search_outlined),
                isPassword: false,
                type: TextInputType.number,
                controller: searchPhoneNumberText,
                maxLines: 1,
                onChange: (value) {
                  searchEmpCubit.search(
                    empPhoneNumber: value,
                    colllectinID: collectionID(scoop),
                  );
                },
                validate: (value) {
                  if (value.isEmpty) {
                    return "ادخل رقم هاتف العامل";
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hint: "اسم العامل",
          label: "اسم العامل",
          prefix: const Icon(Icons.search_outlined),
          isPassword: false,
          type: TextInputType.text,
          controller: searchNameText,
          maxLines: 1,
          onChange: (value) {
            searchEmpCubit.search(
              empName: value,
              colllectinID: collectionID(scoop),
            );
          },
          validate: (value) {
            if (value.isEmpty) {
              return "ادخل اسم العامل";
            }
            return null;
          },
        ),
      ],
    );
  }

 
}
