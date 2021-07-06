import 'package:admin_web_portal/bloc/Roles/roles_event.dart';
import 'package:admin_web_portal/bloc/admin/admin_bloc.dart';
import 'package:admin_web_portal/bloc/admin/admin_event.dart';
import 'package:admin_web_portal/repository/admin.dart';
import 'package:admin_web_portal/repository/authentication.dart';
import 'package:admin_web_portal/repository/roles.dart';
import 'package:admin_web_portal/router/navigator_service.dart';
import 'package:admin_web_portal/router/routes.dart';
import 'package:admin_web_portal/router/transition.dart';
import 'package:admin_web_portal/utils/constants.dart';
import 'package:admin_web_portal/utils/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bloc/Roles/roles_bloc.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/authentication/authentication_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Routes routes;
  final dio = Dio();

  NavigatorService navigatorService = NavigatorService();

  setupDioClient() {
    dio.options.baseUrl = 'https://gateway-service-3twwvyageq-as.a.run.app';

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
  }

  @override
  void initState() {
    EquatableConfig.stringify = true;
    routes = Routes();
    setupDioClient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(create: (context) => dio),
        RepositoryProvider<NavigatorService>(
            create: (context) => navigatorService),
        RepositoryProvider<SharedPreferencesUtil>(
            create: (context) => SharedPreferencesUtil()),
        RepositoryProvider<AuthenticationRepository>(
          create: (context) => AuthenticationRepository(
            context.read<Dio>(),
            context.read<SharedPreferencesUtil>(),
          ),
        ),
        RepositoryProvider<RolesRepository>(
          create: (context) => RolesRepository(
            context.read<Dio>(),
          ),
        ),
        RepositoryProvider<AdminRepository>(
          create: (context) => AdminRepository(
            context.read<Dio>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
                context.read<AuthenticationRepository>(),
                context.read<SharedPreferencesUtil>())
              ..add(
                AuthenticationAppStarted(),
              ),
          ),
          BlocProvider<RolesBloc>(
            create: (context) => RolesBloc(
              context.read<RolesRepository>(),
              context.read<NavigatorService>(),
            )..add(
                RolesLoaded(),
              ),
          ),
          BlocProvider<AdminBloc>(
            create: (context) => AdminBloc(
              context.read<AdminRepository>(),
              context.read<NavigatorService>(),
            )..add(
                AdminLoaded(),
              ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Admin portal',
          theme: ThemeData(
            primarySwatch: MaterialColor(
              0xFFE5E5E5,
              const <int, Color>{
                50: const Color(0xFFE5E5E5),
                100: const Color(0xFFE5E5E5),
                200: const Color(0xFFE5E5E5),
                300: const Color(0xFFE5E5E5),
                400: const Color(0xFFE5E5E5),
                500: const Color(0xFFE5E5E5),
                600: const Color(0xFFE5E5E5),
                700: const Color(0xFFE5E5E5),
                800: const Color(0xFFE5E5E5),
                900: const Color(0xFFE5E5E5),
              },
            ),
            buttonColor: buttonColor,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttonColor),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
            )),
            pageTransitionsTheme: NoPageTransitions(),
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme.copyWith(
                      headline1: TextStyle(fontSize: 24, color: bodyColor),
                      headline2: TextStyle(fontSize: 22, color: bodyColor),
                      headline3: TextStyle(fontSize: 20, color: selectedColor),
                    )).apply(
              bodyColor: bodyColor,
            ),
            canvasColor: secondaryColor,
          ),
          onGenerateRoute: routes.generateRoute,
          // home: LayoutTemplate(),
        ),
      ),
    );
  }
}
