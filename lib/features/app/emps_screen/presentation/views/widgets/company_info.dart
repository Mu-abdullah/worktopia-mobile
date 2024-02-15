import 'package:flutter/material.dart';

import '../../../../../../core/utils/size.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../../../../../core/widgets/divider.dart';
import 'departmets_detailes_botton_sheet.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({
    super.key,
    required this.widget,
  });

  final DepartmentDetilesScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: dontReturnData()
          ? [const SizedBox(height: 10), const TitleText(text: "عقد عملية")]
          : [
              CustomDivider(
                indent: CustomSize.width(context, .15),
                endIndent: CustomSize.width(context, .15),
              ),
              const SizedBox(height: 5),
              const TitleText(text: "الراتب"),
              const SizedBox(height: 10),
              TitleText(
                text:
                    "ما يتقاضاه المقاول عن العامل: ${widget.model.companySalaryFroEmp!.toString()} جنيه",
                maxLine: 2,
                isTitle: false,
              ),
              const SizedBox(height: 10),
              TitleText(
                text: "راتب العامل: ${widget.model.empSalary!.toString()} جنيه",
                maxLine: 2,
                isTitle: false,
              ),
              const SizedBox(height: 5),
              CustomDivider(
                indent: CustomSize.width(context, .15),
                endIndent: CustomSize.width(context, .15),
              ),
              const SizedBox(height: 10),
              const TitleText(text: "اليوم الاضافي"),
              const SizedBox(height: 5),
              TitleText(
                text:
                    "اليوم الاضافي للمقاول: ${widget.model.extraDayForCompany!.toString()} جنيه",
                maxLine: 2,
                isTitle: false,
              ),
              const SizedBox(height: 10),
              TitleText(
                text:
                    "اليوم الاضافي للعامل: ${widget.model.extraDayForEmp!.toString()} جنيه",
                maxLine: 2,
                isTitle: false,
              ),
              const SizedBox(height: 5),
              CustomDivider(
                indent: CustomSize.width(context, .15),
                endIndent: CustomSize.width(context, .15),
              ),
              const SizedBox(height: 10),
              const TitleText(text: "الساعة الاضافية"),
              const SizedBox(height: 5),
              TitleText(
                text:
                    "الساعة النهارية للمقاول: ${widget.model.extraHourForCompany!.toString()} جنيه",
                maxLine: 2,
                isTitle: false,
              ),
              const SizedBox(height: 10),
              TitleText(
                text:
                    "الساعة النهارية للعامل: ${widget.model.extraHourForEmp!.toString()} جنيه",
                maxLine: 2,
                isTitle: false,
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.model.extraNightShiftHourForCompany! == 0
                    ? []
                    : [
                        TitleText(
                          text:
                              "الساعة الليلية للمقاول: ${widget.model.extraNightShiftHourForCompany!.toString()} جنيه",
                          maxLine: 2,
                          isTitle: false,
                        ),
                        const SizedBox(height: 10),
                        TitleText(
                          text:
                              "الساعة الليلية للعامل: ${widget.model.extraNightShiftHourForEmp!.toString()} جنيه",
                          maxLine: 2,
                          isTitle: false,
                        ),
                      ],
              ),
            ],
    );
  }

  bool dontReturnData() {
    return widget.model.companySalaryFroEmp == "عقد عملية" ? true : false;
  }
}
