import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entites/company_model.dart';
import '../../../../../../core/helper/firebase_names.dart';
import 'new_company_state.dart';

class NewCompanyCubit extends Cubit<NewCompanyState> {
  NewCompanyCubit() : super(NewCompanyInitial());
  static NewCompanyCubit get(context) => BlocProvider.of(context);

  final CollectionReference collection =
      FirebaseFirestore.instance.collection(FBFirestoreName.companyCollection);

  void newCompany({required CompanyModel companyModel}) {
    emit(LoadingNewCompany());
    try {
      collection.doc(companyModel.companyName).set(companyModel.toJson());
      emit(SuccessNewCompany());
    } catch (e) {
      emit(FailedNewCompany(e.toString()));
    }
  }
}
