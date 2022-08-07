import 'package:daily_news/business_logic/cubit/dynamic_theme_cubit.dart';
import 'package:daily_news/global/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'app_router.dart';
import 'package:bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  HydratedBlocOverrides.runZoned(
    () => runApp(DailyNews(
      appRouter: AppRouter(),
    )),
    storage: storage,
  );
}

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DynamicThemeCubit>(
        create: (context) => DynamicThemeCubit(),
        child: BlocBuilder<DynamicThemeCubit, DynamicThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appThemeData[state.theme],
              onGenerateRoute: appRouter.generateRoute,
            );
          },
        ));
  }
}
