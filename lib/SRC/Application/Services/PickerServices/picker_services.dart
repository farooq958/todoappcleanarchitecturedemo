
import 'package:file_picker/file_picker.dart';

class PickFile {
   Future<List<String?>> pickImage() async {
    // ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      // allowedExtensions: [".jpg",".png",".heic","jpeg"],
      allowMultiple: true,
    );
    if (result == null) return [];
    final List<String?> images = result.paths??[];
    return images;
  }

}