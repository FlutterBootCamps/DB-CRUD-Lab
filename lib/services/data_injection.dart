import 'package:get_it/get_it.dart';
import 'package:memberlab/services/supabase_service.dart';

class DataInjection {
  final locator = GetIt.instance;

void setup(){
locator.registerSingleton<DBService>(DBService());
}}