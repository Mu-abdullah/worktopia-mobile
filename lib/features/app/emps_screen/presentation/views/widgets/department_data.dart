import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../../../../../../core/entites/department_model.dart';
import '../../../../../../core/helper/firebase_names.dart';
import '../../../../../../core/utils/tables_name.dart';
import 'data.dart';

class DepartmentData extends StatelessWidget {
  const DepartmentData({
    super.key,
    required this.scoop,
  });
  final String scoop;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection(FBFirestoreName.departmentCollection)
            .doc(collectionID())
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Text('Document does not exist');
          } else {
            // Access the specific field from the document
            final department =
                DepartmentsModel.fromDocumentSnapshot(snapshot.data!);
            return DepartmentsData(
              scoop: scoop,
              model: department,
            );
          }
        },
      ),
    );
  }

  String collectionID() {
    if (scoop == TableName.supplyEmp) {
      return FBFirestoreName.dDocumentSupplyEmp;
    }
    if (scoop == TableName.buffet) {
      return FBFirestoreName.dDocumentBuffet;
    }
    if (scoop == TableName.clean) {
      return FBFirestoreName.dDocumentClean;
    }
    if (scoop == TableName.farm) {
      return FBFirestoreName.dDocumentZra3a;
    } else {
      return FBFirestoreName.dDocumentAntiReed;
    }
  }
}
