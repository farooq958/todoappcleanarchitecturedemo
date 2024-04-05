import 'dart:developer';

import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/imports.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/text_styles.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Domain/Model/todomodel.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Presentation/Common/app_text.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Presentation/Common/display_images.dart';

class TodoContainer extends StatelessWidget {
  const TodoContainer({super.key,  this.todo, this.dismissedCalled});
final TodoItem? todo;
 final void Function()? dismissedCalled;
  @override
  Widget build(BuildContext context) {
    return  Dismissible(
      key: UniqueKey(),
      onDismissed: (direction){
        log("directionnnn");
        log(direction.toString());
if(direction ==DismissDirection.startToEnd || direction == DismissDirection.endToStart )
  {
    dismissedCalled!();

  }
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.black45,width: 1.2)),
        child: Column(

          children: [

            AppText(todo!.title, style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 18)),
            DisplayFileImage(fileImage: todo!.image!, onDeleteTap: (){})

          ],

        ),

      ),
    );
  }
}
