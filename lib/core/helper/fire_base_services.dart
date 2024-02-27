import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/foundation.dart';
import 'package:worktopia/core/helper/firebase_names.dart';

import '../entites/department_model.dart';
import '../entites/emoloyees_model.dart';

class FirebaseService {
  final CollectionReference departmentCollection =
      FirebaseFirestore.instance.collection(
    FBFirestoreName.departmentCollection,
  );
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////CREATE DEPARTMENT///////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  Future<void> createDepartment({
    required DepartmentsModel departmentData,
    String? docId,
  }) async {
    try {
      if (docId != null) {
        await departmentCollection.doc(docId).set(departmentData.toJson());
      } else {
        await departmentCollection.add(departmentData.toJson());
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error creating department: $e");
      }
      rethrow;
    }
  }
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////UPDATE DEPARTMENT///////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  Future<void> updateDepartment({
    required DepartmentsModel departmentData,
    String? docId,
  }) async {
    try {
      if (docId != null) {
        await departmentCollection.doc(docId).update(departmentData.toJson());
      } else {
        await departmentCollection.doc(docId).update(departmentData.toJson());
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error creating department: $e");
      }
      rethrow;
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////CREATE EMPLOYEE////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  Future<void> createEmp({
    required String departmentId,
    required EmployeesModel employeeData,
    required String empID,
  }) async {
    final CollectionReference empCollection = departmentCollection
        .doc(departmentId)
        .collection(FBFirestoreName.empSubCollection);
    await empCollection.doc(empID).set(employeeData.toJson());
  }
  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////UPDATE EMPLOYEE////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  Future<void> updateEmp({
    required String departmentId,
    required EmployeesModel employeeData,
    required String empID,
  }) async {
    final CollectionReference empCollection = departmentCollection
        .doc(departmentId)
        .collection(FBFirestoreName.empSubCollection);
    await empCollection.doc(empID).update(employeeData.toJson());
  }

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////GET SUPER COLLECTION DATA///////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  Future<DocumentSnapshot?> getCollectionData({
    required String departmentCollection,
  }) async {
    try {
      DocumentSnapshot departmentSnapshot =
          await _firestore.collection(departmentCollection).doc().get();
      if (departmentSnapshot.exists) {
        return departmentSnapshot;
      } else {
        return null;
      }
    } catch (e) {
      // Handle errors appropriately
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////GET ACTIVE COMPANY//////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  Future<List<DocumentSnapshot>> getActiveCompanies() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(FBFirestoreName.departmentCollection)
          .get();

      // Extract documents from the query snapshot
      List<DocumentSnapshot> documents = querySnapshot.docs;

      return documents;
    } catch (e) {
      // Handle errors appropriately
      return []; // Return an empty list in case of error
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////GET DEPARTMENT DATA/////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  Future<void> getDepartmentData({required String docId}) async {
    await FirebaseFirestore.instance
        .collection(FBFirestoreName.departmentCollection)
        .doc(docId)
        .get();
  }

  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////////GET SUB COLLECTION SIZE////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  Future<int> getSubcollectionLength({
    required String departmentId,
    required String departmentCollection,
    required String subCollection,
  }) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(
              departmentCollection) // Assuming the parent collection name
          .doc(departmentId)
          .collection(subCollection)
          .get();

      return querySnapshot.size;
    } catch (e) {
      return 0; // Return 0 in case of error
    }
  }
  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////////GET SUB COLLECTION DATA////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  Future<QuerySnapshot?> getSubCollectionData({
    required String departmentId,
    required String departmentCollection,
    required String subCollection,
    required String jobStatus,
  }) async {
    QuerySnapshot employeeSnapshot = await _firestore
        .collection(departmentCollection)
        .doc(departmentId)
        .collection(subCollection)
        .where('jobStatus', isEqualTo: jobStatus)
        .get();
    if (employeeSnapshot.docs.isNotEmpty) {
      return employeeSnapshot;
    }
    return null;
  }

  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////////Search COLLECTION DATA////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  Future<QuerySnapshot?> searchEmp({
    required String departmentId,
    required String departmentCollection,
    required String subCollection,
    String? empName,
    String? empId,
    String? empNId,
    String? empPhoneNumber,
  }) async {
    try {
      Query query = _firestore
          .collection(departmentCollection)
          .doc(departmentId)
          .collection(subCollection);

      if (empName != null) {
        query = query.where('empName', isEqualTo: empName);
      }
      if (empId != null) {
        query = query.where('empId', isEqualTo: empId);
      }
      if (empNId != null) {
        query = query.where('empNId', isEqualTo: empNId);
      }
      if (empPhoneNumber != null) {
        query = query.where('empPhoneNumber', isEqualTo: empPhoneNumber);
      }

      QuerySnapshot employeeSnapshot = await query.get();

      employeeSnapshot.docs.map((doc) => doc.data()).toList();

      return employeeSnapshot.docs.isNotEmpty ? employeeSnapshot : null;
    } catch (e) {
      // print('Error searching employees: $e');
      return null;
    }
  }
}
