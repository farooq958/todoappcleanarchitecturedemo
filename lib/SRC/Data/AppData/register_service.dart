import 'package:get_it/get_it.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Application/Services/NavigatorService/navigator_service.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Application/Services/PickerServices/picker_services.dart';

mixin RegisterService{
  final servicePickerLocator = GetIt.instance;
  final serviceNavigatorLocator = GetIt.instance;

  Future registerServices()async{

    servicePickerLocator.registerLazySingleton<PickFile>(() => PickFile());

    serviceNavigatorLocator.registerLazySingleton<Navigate>(() => Navigate());
  }


}