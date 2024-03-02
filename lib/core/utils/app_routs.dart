import 'package:go_router/go_router.dart';
import 'package:worktopia/features/app/home/presentation/views/widgets/departmets_detailes.dart';
import 'package:worktopia/features/app/home/presentation/views/home.dart';

import '../../features/app/auth/views/auth_screen.dart';
import '../../features/app/emps_screen/presentation/views/employees.dart';
import '../../features/app/splash_screen/splash_screen.dart';
import '../../features/edit_screens/edit_department_screen/presentation/views/edit_department_screen.dart';
import '../../features/edit_screens/edit_emp_screen/presentation/views/edit_screeen.dart';
import '../../features/new_screens/new_department/presentation/views/departments_detailes_screen.dart';
import '../../features/new_screens/new_emp/presentation/views/new_emp_screen.dart';
import '../entities/department_model.dart';
import '../entities/emoloyees_model.dart';

abstract class AppRouter {
  // static const homeScreen = '/homeScreen';
  static const newHomeScreen = '/newHomeScreen';
  static const empScreen = '/empScreen';
  static const newEmpScreen = '/newEmpScreen';
  static const departmentScreen = '/departmentScreen';
  static const editeDepartmentScreen = '/editeDepartmentScreen';
  static const editEmpScreen = '/editEmpScreen';
  static const authScreen = '/authScreen';
  static const splashScreen = '/splashScreen';
  static const departmentDetiles = '/departmentDetiles';
  static const searchScreen = '/searchScreen';

  static final router = GoRouter(
    initialLocation: splashScreen,
    routes: [
      // GoRoute(
      //   path: searchScreen,
      //   builder: (context, state) => SearchEmp(
      //     scoop: state.extra as String,
      //   ),
      // ),
      
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: newHomeScreen,
        builder: (context, state) => const NewHome(),
      ),
      // GoRoute(
      //   path: homeScreen,
      //   builder: (context, state) => const HomeScreen(),
      // ),
      GoRoute(
        path: empScreen,
        builder: (context, state) =>
            EmployeesScreen(departmentModel: state.extra as DepartmentsModel),
      ),
      GoRoute(
        path: newEmpScreen,
        builder: (context, state) => const NewEmpScreen(),
      ),
      GoRoute(
        path: departmentScreen,
        builder: (context, state) => const DepartmentsScreen(),
      ),
      GoRoute(
        path: editEmpScreen,
        builder: (context, state) => EditEmpScreen(
          model: state.extra as EmployeesModel,
        ),
      ),
      GoRoute(
        path: editeDepartmentScreen,
        builder: (context, state) => EditDepartmentScreen(
          model: state.extra as DepartmentsModel,
        ),
      ),
      GoRoute(
        path: departmentDetiles,
        builder: (context, state) => DepartmentDetilesScreen(
          model: state.extra as DepartmentsModel,
        ),
      ),
      GoRoute(
        path: authScreen,
        builder: (context, state) => const AuthScreen(),
      ),
    ],
  );
}
