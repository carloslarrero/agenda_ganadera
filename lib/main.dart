import 'package:flutter_bloc/flutter_bloc.dart';
import 'barril.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AppDatabase>(
      create: (context) => AppDatabase(),
      dispose: (database) => database.close(),
      child: Builder(
        builder: (context) {
          final AppDatabase database = context.read<AppDatabase>();

          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider<PesajeRepository>(
                create: (context) => PesajeRepository(database),
              ),
              RepositoryProvider<StockRepository>(
                create: (context) => StockRepository(database),
              ),
              RepositoryProvider<ControlRepository>(
                create: (context) => ControlRepository(database),
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<PesajeCubit>(
                  create: (context) => PesajeCubit(
                    repository: context.read<PesajeRepository>(),
                  )..observarControles(),
                ),
                BlocProvider<StockCubit>(
                  create: (context) => StockCubit(
                    repository: context.read<StockRepository>(),
                  )..observarStock(),
                ),
                BlocProvider<CarpetasControlCubit>(
                  create: (context) => CarpetasControlCubit(
                    repository: context.read<ControlRepository>(),
                  )..observarCarpetas(),
                ),
              ],
              child: const MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Agenda Ganadera',
                home: MainNavigation(),
              ),
            ),
          );
        },
      ),
    );
  }
}
