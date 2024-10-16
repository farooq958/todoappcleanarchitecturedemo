import 'package:flutter/cupertino.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Application/Services/PickerServices/picker_use_case.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/di/service_locator.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Domain/Model/todomodel.dart';

class TodoController extends ChangeNotifier {
  
  
 static  ValueNotifier<List<TodoItem>> todoController=ValueNotifier([]);
 final PickImagesUseCase pickImagesUseCase = sl<PickImagesUseCase>();


 static ValueNotifier<List<String?>>  imagesController=ValueNotifier([]);

 Future<List<String?>> pickImages() async {
  imagesController.value = await pickImagesUseCase.call();
  imagesController.notifyListeners();
  return imagesController.value;

 }

}