import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_care_app/core/localization/localization_setup.dart';
import 'package:pet_care_app/core/store/store_preference.dart';
import 'package:pet_care_app/instance.dart';
import 'package:pet_care_app/modules/app/presentation/bloc/app_bloc.dart';
import 'package:pet_care_app/routes/app_router.dart';

late GetIt getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt = GetIt.instance;
  if (!getIt.isRegistered<AppBloc>()) {
    getIt.registerSingleton<AppBloc>(AppBloc());
  }
  await StorePreference.create();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppBloc _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = getIt<AppBloc>();
  }

  @override
  void didChangeDependencies() {
    getInstance(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _appBloc.close();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppState>(
      stream: _appBloc.stream,
      initialData: _appBloc.state,
      builder: (context, snapshot) => MaterialApp.router(
        title: 'Flutter Demo',
        locale: snapshot.data?.local,
        supportedLocales: LocalizationSetup.supportedLocales,
        localizationsDelegates: LocalizationSetup.localizationsDelegates,
        localeResolutionCallback:
            LocalizationSetup.localeResolutionCallback,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: AppRouter.router,
        builder: (context, child) => ScreenUtilInit(
          designSize: const Size(402, 871),
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}
