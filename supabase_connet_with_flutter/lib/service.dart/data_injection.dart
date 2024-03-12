import 'package:get_it/get_it.dart';
import 'package:supabase_connet_with_flutter/service.dart/supabase_service.dart';

class DataInjection{
  final locator = GetIt.instance;
  
  // Setup function 
  void setup(){ 
    locator.registerSingleton<DBService>(DBService());
  }
  
}