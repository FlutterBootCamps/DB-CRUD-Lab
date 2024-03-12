import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_connet_with_flutter/bloc/member_bloc.dart';
import 'package:supabase_connet_with_flutter/home_screen.dart';
import 'package:supabase_connet_with_flutter/service.dart/data_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // or assets/.env- لامتداد الملف

  await Supabase.initialize(
    url: dotenv.env['urlSupabase']!,
    anonKey: dotenv.env['anonKeySupabase']!,
  );

  DataInjection().setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemberBloc()..add(FetchDataEvent()),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
