import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/view/ui/Dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 1))
      .then((value) => FlutterNativeSplash.remove());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: true,
              fontFamily: BaseStrings.poppins,
              datePickerTheme: DatePickerThemeData(
                surfaceTintColor: BaseColors.whiteColor,
                cancelButtonStyle: ButtonStyle(
                    foregroundColor:
                        MaterialStatePropertyAll(BaseColors.brandColorList[1]),
                    textStyle: MaterialStatePropertyAll(
                        TextStyle(fontWeight: FontWeight.w900))),
                confirmButtonStyle: ButtonStyle(
                    foregroundColor:
                        MaterialStatePropertyAll(BaseColors.brandColorList[1]),
                    textStyle: MaterialStatePropertyAll(
                        TextStyle(fontWeight: FontWeight.w900))),
                dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return BaseColors.brandColorList[1];
                  }
                  return Colors.transparent;
                }),
              ),
              textSelectionTheme:
                  const TextSelectionThemeData(cursorColor: Colors.black),
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  iconTheme: IconThemeData(color: BaseColors.whiteColor),
                  elevation: 0)),
          home: DashboardScreen()),
    );
  }
}
