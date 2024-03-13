import 'package:database_with_flutter_1/bloc/supabase_bloc.dart';
import 'package:database_with_flutter_1/pages/home_page.dart';
import 'package:database_with_flutter_1/service/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: dotenv.env["urlSupabase"]!,
      anonKey: dotenv.env["anoneKeySupabase"]!);
  await DataLayer().setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupabaseBloc()..add(FetchDataEvent()),
      child: const MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
