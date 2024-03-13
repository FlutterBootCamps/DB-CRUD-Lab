import 'package:database_with_flutter_1/service/suupabase_services.dart';
import 'package:get_it/get_it.dart';

class DataLayer {
  final locater = GetIt.instance;
  Future setup() async {
    locater.registerSingleton<DBServices>(DBServices());
  }
}
