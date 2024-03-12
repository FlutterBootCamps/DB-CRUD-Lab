import 'package:connect_suba_and_fluttter/api/serves.dart';
import 'package:get_it/get_it.dart';

class gitIt{
  final locator = GetIt.instance;
void init(){
  locator.registerSingleton<serves>(serves());
}
}