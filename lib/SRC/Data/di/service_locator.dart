import 'package:get_it/get_it.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Application/Services/PickerServices/picker_use_case.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/imports.dart';


final sl = GetIt.instance;

void setupLocator() {
  // Register PickFile service as a singleton
  sl.registerLazySingleton(() => PickFile());

  // Register PickImagesUseCase and inject the PickFile service into it
  sl.registerLazySingleton(() => PickImagesUseCase(sl<PickFile>()));
}
