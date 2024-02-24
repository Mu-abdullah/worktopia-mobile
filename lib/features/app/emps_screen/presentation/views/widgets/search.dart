import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worktopia/core/entites/emoloyees_model.dart';
import 'package:worktopia/core/widgets/default_texts.dart';

import '../../manger/search_cubit/search_cubit.dart';
import 'employee_item.dart';
import 'search_fields.dart';

class SearchEmp extends StatelessWidget {
  const SearchEmp({super.key, required this.scoop});
  final String scoop;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchEmpCubit(),
      child: SearchEmpView(scoop: scoop),
    );
  }
}

class SearchEmpView extends StatefulWidget {
  const SearchEmpView({super.key, required this.scoop});
  final String scoop;

  @override
  State<SearchEmpView> createState() => _SearchEmpViewState();
}

class _SearchEmpViewState extends State<SearchEmpView> {
  @override
  void initState() {
    super.initState();
  }

  var searchIDText = TextEditingController();
  var searchPhoneNumberText = TextEditingController();
  var searchNameText = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final searchEmpCubit = context.read<SearchEmpCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const TitleText(text: 'البحث عن عامل'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SearchFields(
                searchIDText: searchIDText,
                searchEmpCubit: searchEmpCubit,
                searchPhoneNumberText: searchPhoneNumberText,
                searchNameText: searchNameText,
                scoop: widget.scoop,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchEmpCubit, List<EmployeesModel>>(
              builder: (context, snapshot) {
                if (snapshot.isEmpty) {
                  return const Center(
                    child: Column(
                      children: [
                        TitleText(text: "لا يوجد بيانات"),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.length,
                  itemBuilder: (context, index) {
                    final document = snapshot[index];
                    return EmployeeItem(
                      emp: document,
                      scoop: widget.scoop,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
