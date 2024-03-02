import 'package:flutter/material.dart';
import 'package:worktopia/core/utils/colors.dart';

import '../../../../../../core/widgets/default_texts.dart';
import '../../../../home/presentation/views/widgets/departmets_detailes.dart';

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
      children: [
        _salary(),
        _extraDay(),
        _extraHour(),
        _nightShiftExtraHour(),
      ],
    );
  }

  Card _nightShiftExtraHour() {
    return Card(
      color: Colors.blue,
      child: data(widget.model.extraNightShiftHourForCompany)
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TitleText(
                    text: "الساعة الاضافية الليلة",
                    titleColor: AppColor.whiteColor,
                  ),
                  const SizedBox(height: 5),
                  TitleText(
                    text:
                        "الساعة الليلية للمقاول: ${widget.model.extraNightShiftHourForCompany!.toString()} جنيه",
                    maxLine: 2,
                    isTitle: false,
                    subTitleColor: AppColor.whiteColor,
                  ),
                  const SizedBox(height: 10),
                  TitleText(
                    text:
                        "الساعة الليلية للعامل: ${widget.model.extraNightShiftHourForEmp!.toString()} جنيه",
                    maxLine: 2,
                    isTitle: false,
                    subTitleColor: AppColor.whiteColor,
                  ),
                ],
              ),
            ),
    );
  }

  Card _extraHour() {
    return Card(
      color: Colors.blue,
      child: data(widget.model.extraHourForCompany)
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TitleText(
                    text: "الساعة الاضافية",
                    titleColor: AppColor.whiteColor,
                  ),
                  const SizedBox(height: 5),
                  TitleText(
                    text:
                        "الساعة النهارية للمقاول: ${widget.model.extraHourForCompany!.toString()} جنيه",
                    maxLine: 2,
                    isTitle: false,
                    subTitleColor: AppColor.whiteColor,
                  ),
                  const SizedBox(height: 10),
                  TitleText(
                    text:
                        "الساعة النهارية للعامل: ${widget.model.extraHourForEmp!.toString()} جنيه",
                    maxLine: 2,
                    isTitle: false,
                    subTitleColor: AppColor.whiteColor,
                  ),
                ],
              ),
            ),
    );
  }

  Card _extraDay() {
    return Card(
      color: Colors.blue,
      child: data(widget.model.extraDayForCompany)
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TitleText(
                    text: "اليوم الاضافي",
                    titleColor: AppColor.whiteColor,
                  ),
                  const SizedBox(height: 5),
                  TitleText(
                    text:
                        "اليوم الاضافي للمقاول: ${widget.model.extraDayForCompany!.toString()} جنيه",
                    maxLine: 2,
                    isTitle: false,
                    subTitleColor: AppColor.whiteColor,
                  ),
                  const SizedBox(height: 10),
                  TitleText(
                    text:
                        "اليوم الاضافي للعامل: ${widget.model.extraDayForEmp!.toString()} جنيه",
                    maxLine: 2,
                    isTitle: false,
                    subTitleColor: AppColor.whiteColor,
                  ),
                ],
              ),
            ),
    );
  }

  Card _salary() {
    return Card(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TitleText(
                text: "الراتب",
                titleColor: AppColor.whiteColor,
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: data(widget.model.companySalaryFroEmp)
                    ? null
                    : TitleText(
                        text:
                            "ما يتقاضاه المقاول عن العامل: ${widget.model.companySalaryFroEmp!.toString()} جنيه",
                        maxLine: 2,
                        isTitle: false,
                        subTitleColor: AppColor.whiteColor,
                      ),
              ),
              SizedBox(height: data(widget.model.companySalaryFroEmp) ? 0 : 10),
              TitleText(
                text: "راتب العامل: ${widget.model.empSalary!.toString()} جنيه",
                maxLine: 2,
                isTitle: false,
                subTitleColor: AppColor.whiteColor,
              ),
            ],
          ),
        ));
  }

  bool data(data) {
    if (data == 0) {
      return true;
    } else {
      return false;
    }
  }
}
