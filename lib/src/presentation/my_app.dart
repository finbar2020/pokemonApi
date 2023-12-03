import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_api/src/config/common.dart';
import 'package:pokemon_api/src/core/framework/router/router.dart';
import 'package:pokemon_api/src/core/framework/themes.dart';
import 'package:pokemon_api/src/injector.dart' as di;
import 'package:pokemon_api/src/presentation/blocs/blocs.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.getIt<PokemonCubit>(),
        ),
        BlocProvider(
          create: (_) => di.getIt<DetailsCubit>(),
        ),
      ],
      child: DynamicColorBuilder(
        builder: (lightColorScheme, darkColorScheme) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) => locale,
            theme: ThemeData(
              colorScheme: lightColorScheme ?? AppTheme.defaultLightColorScheme,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme ?? AppTheme.defaultDarkColorScheme,
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}
