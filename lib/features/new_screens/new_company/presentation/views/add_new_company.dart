
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/entites/company_model.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/default_texts.dart';
import '../manger/cubit/new_company_cubit.dart';
import '../manger/cubit/new_company_state.dart';

class NewCompanyBottomSheet extends StatefulWidget {
  const NewCompanyBottomSheet({super.key});

  @override
  State<NewCompanyBottomSheet> createState() => _NewCompanyBottomSheetState();
}

class _NewCompanyBottomSheetState extends State<NewCompanyBottomSheet> {
  final TextEditingController name = TextEditingController();
  var formKey = GlobalKey<FormState>();

  DateTime initialDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewCompanyCubit(),
      child: BlocConsumer<NewCompanyCubit, NewCompanyState>(
        listener: (context, state) {
          if (state is SuccessNewCompany) {
            Navigator.of(context).pop();
            snackBar(
              context,
              contentText: "تم اضافة الشركة بنجاح",
              seconds: 3,
              background: AppColor.navyColor,
              contentColor: AppColor.yellowColor,
            );
          }
        },
        builder: (context, state) {
          NewCompanyCubit cubit = NewCompanyCubit.get(context);
          return Padding(
            padding: EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TitleText(text: "اضافة شركة جديدة"),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hint: "اسم الشركة",
                    label: "اسم الشركة",
                    prefix: const Icon(Iconsax.home_hashtag),
                    isPassword: false,
                    controller: name,
                    type: TextInputType.name,
                    maxLines: 1,
                    validate: (value) {
                      if (value.isEmpty) {
                        return _wanted;
                      }
                      return null;
                    },
                    onChange: (p0) {
                      arabicOnly(p0, contrroler: name);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                      loadingState: state is LoadingNewCompany ? true : false,
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          cubit.newCompany(
                              companyModel: CompanyModel(
                            id: generateDocumentId(),
                            companyName: name.text,
                          ));
                        }
                      },
                      buttonName: "اضف الشركة"),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String get _wanted => "مطلوب";
}
