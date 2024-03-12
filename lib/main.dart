import 'package:connect_suba_and_fluttter/bloc/member_bloc.dart';
import 'package:connect_suba_and_fluttter/setup/git_it.dart';
import 'package:connect_suba_and_fluttter/page/home_page.dart';
import 'package:connect_suba_and_fluttter/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
gitIt().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemberBloc()..add(gitDataEvent()),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
