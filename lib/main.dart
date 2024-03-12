import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_week7_day3/bloc/data_bloc.dart';
import 'package:flutter_week7_day3/screens/home_page.dart';
import 'package:flutter_week7_day3/utils/setup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env["supabaseURL"]!,
    anonKey: dotenv.env["supabaseAnonKey"]!,
  );
  setup();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(),
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
