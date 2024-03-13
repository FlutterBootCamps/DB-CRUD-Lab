import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:memberlab/bloc/member_bloc.dart';
import 'package:memberlab/home_screen.dart';
import 'package:memberlab/services/data_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: dotenv.env["SUPABASE_URL"]!,
      anonKey: dotenv.env["SUPABASE_ANON_KEY"]!);
 DataInjection().setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(//add .evt
      create: (context) => MemberBloc()..add(fetchEvent()),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
