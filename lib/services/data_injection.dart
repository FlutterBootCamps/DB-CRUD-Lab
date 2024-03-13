import 'package:get_it/get_it.dart';
import 'package:supabase__lab/services/service.dart';

class DataInjection {
  final locater = GetIt.instance;

  void setup() {
    locater.registerSingleton(DataService());
  }
}
