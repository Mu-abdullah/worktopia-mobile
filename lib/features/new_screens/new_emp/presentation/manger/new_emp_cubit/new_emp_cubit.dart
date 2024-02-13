import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fire_storage;

import '../../../../../../core/entites/emoloyees_model.dart';
import '../../../../../../core/helper/fire_base_services.dart';
import '../../../../../../core/helper/firebase_names.dart';
import '../../../../../../core/utils/tables_name.dart';
import '../../../data/department_data.dart';
import '../../../data/scoop_data.dart';
import 'new_emp_state.dart';

class NewEmpCubit extends Cubit<NewEmpState> {
  NewEmpCubit() : super(NewEmpInitial());

  static NewEmpCubit get(context) => BlocProvider.of(context);

  File? image;
  final picker = ImagePicker();
  String? imagePath;
  String? imageUrl;
  String? scoopValue;
  String? departmentValue;
  String? departmentId;
  List<String> department = departmentItems;

  void whichPaltform() {
    if (kIsWeb == true) {
      getImageFromPc();
    } else {
      getImage();
    }
  }

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(GetImageFromGallery());
    } else {
      emit(ErrorImageFromGallery());
    }
  }

  Uint8List? pickedBytes;

  Future<void> getImageFromPc() async {
    final picked = await FilePicker.platform.pickFiles();
    if (picked != null && picked.files.isNotEmpty) {
      pickedBytes = picked.files.first.bytes;
      emit(GetImageFromGallery());
    } else {
      emit(ErrorImageFromGallery());
    }
  }

  Future<String?> uploadPhotoFromWeb({required String department}) async {
    emit(UploadImageLoading());
    try {
      if (pickedBytes == null) {
        emit(UploadImageFailed(error: 'No image selected'));
        return null;
      }

      final imageName =
          "emp/$department/${DateTime.now().millisecondsSinceEpoch.toString()}";

      final metadata = fire_storage.SettableMetadata(
        contentType:
            'image/jpeg', // Specify the content type (e.g., 'image/jpeg', 'image/png', etc.)
      );

      final uploadTask = await fire_storage.FirebaseStorage.instance
          .ref(imageName)
          .putData(pickedBytes!, metadata);

      imageUrl = await uploadTask.ref.getDownloadURL();
      imagePath = uploadTask.ref.fullPath;

      emit(UploadImageSuccess());
      return imageUrl;
    } catch (e) {
      emit(UploadImageFailed(error: e.toString()));
      return null;
    }
  }

  Future<String?> uploadPhotoFromAndroid({required String department}) async {
    emit(UploadImageLoading());
    try {
      final uploadTask = await fire_storage.FirebaseStorage.instance
          .ref()
          .child("emp/$department/${Uri.file(image!.path).pathSegments.last}")
          .putFile(image!);
      imageUrl = await uploadTask.ref.getDownloadURL();
      imagePath = uploadTask.ref.fullPath;

      emit(UploadImageSuccess());
    } catch (e) {
      emit(UploadImageFailed(error: e.toString()));
    }
    return imageUrl;
  }

  void changeScoop(value) {
    scoopValue = value;
    emit(DropMenuChanged());
  }

  void changeDepartment(value) {
    departmentValue = value;
    emit(DropMenuChanged());
  }

  List<String> departmentAndScoops() {
    switch (departmentValue) {
      case TableName.supplyEmp:
        return empSupplies;
      case TableName.clean:
        return clean;
      case TableName.buffet:
        return buffet;
      case TableName.farm:
        return zra3a;
      case TableName.reeds:
        return hesh;
      default:
        return [
          "اختار القسم",
        ];
    }
  }

  String departmentCollectionId() {
    if (departmentValue == TableName.supplyEmp) {
      return departmentId = FBFirestoreName.dDocumentSupplyEmp;
    }
    if (departmentValue == TableName.buffet) {
      return departmentId = FBFirestoreName.dDocumentBuffet;
    }
    if (departmentValue == TableName.clean) {
      return departmentId = FBFirestoreName.dDocumentClean;
    }
    if (departmentValue == TableName.farm) {
      return departmentId = FBFirestoreName.dDocumentZra3a;
    }

    return FBFirestoreName.dDocumentAntiReed;
  }

  Future<void> addEmpInfo({
    required EmpsModels emp,
  }) async {
    emit(CreateEmpLoading());
    try {
      FirebaseService().createEmp(
        departmentId: departmentCollectionId(),
        employeeData: emp,
        empID: emp.empNId!,
      );
      emit(CreateEmpSuccess());
    } catch (e) {
      emit(CreateEmpFailure(error: e.toString()));
    }
  }

  Future<String?> uploadPhotoAndAddEmpInfo({
    required String department,
    required EmpsModels emp,
  }) async {
    emit(UploadImageLoading());
    try {
      // Upload image to Firebase Storage
      final uploadTask = await fire_storage.FirebaseStorage.instance
          .ref()
          .child("emp/$department/${Uri.file(image!.path).pathSegments.last}")
          .putFile(image!);
      // Get download URL for the uploaded image
      imageUrl = await uploadTask.ref.getDownloadURL();
      imagePath = uploadTask.ref.fullPath;

      // Update emp model with image URL
      emp.empImage = imageUrl;

      // Add emp info with updated model
      await addEmpInfo(emp: emp);

      emit(UploadImageSuccess());
    } catch (e) {
      emit(UploadImageFailed(error: e.toString()));
    }
    return imageUrl;
  }
}
