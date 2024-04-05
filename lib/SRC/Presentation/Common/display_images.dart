import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/colors_pallete.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/imports.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/text_styles.dart';

import 'app_text.dart';

class DisplayFileImage extends StatelessWidget {
  final String fileImage;
  final VoidCallback onDeleteTap;

  // final  int index;

  const DisplayFileImage({
    super.key,
    required this.fileImage,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(fileImage),
      width: 80,
      height: 80,
      fit: BoxFit.fitWidth,
    );
  }
}



class DisplayFile extends StatelessWidget {
  final PlatformFile? file;
  final VoidCallback onDeleteTap;
  final int index;

  const DisplayFile({
    super.key,
    required this.file,
    required this.index,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AppText(
              file!.name,
              maxLine: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.circularStdRegular(context),
            ),
          ),
          GestureDetector(
            onTap: onDeleteTap,
            behavior: HitTestBehavior.opaque,
            child: Icon(
              Icons.delete,
              color: AppColors.redColor,
              size: 23,
            ),
          ),
        ],
      ),
    );
  }
}
