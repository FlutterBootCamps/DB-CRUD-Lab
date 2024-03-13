import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase__lab/bloc/member_bloc.dart';
import 'package:supabase__lab/home_page.dart';
import 'package:supabase__lab/services/data_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env["url"]!,
    anonKey: dotenv.env["anonKey"]!,
  );
  DataInjection().setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemberBloc()..add(fetchDataEvent()),
      child: const MaterialApp(home: HomePage()),
    );
  }
}
