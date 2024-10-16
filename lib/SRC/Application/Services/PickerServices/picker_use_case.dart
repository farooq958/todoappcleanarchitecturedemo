
import 'dart:async';

import 'package:todoappcleanarchitecturedemo/SRC/Application/Services/PickerServices/picker_services.dart';

class PickImagesUseCase {
  final PickFile pickFile;

  PickImagesUseCase(this.pickFile);

  Future<List<String?>> call() async {
    return await pickFile.pickImage();
  }
}
