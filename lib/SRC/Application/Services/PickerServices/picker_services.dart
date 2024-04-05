
import 'package:file_picker/file_picker.dart';

class PickFile {
   Future pickImage() async {
    // ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      // allowedExtensions: [".jpg",".png",".heic","jpeg"],
      allowMultiple: true,
    );
    if (result == null) return [];
    final images = result.paths;
    return images;
  }

}