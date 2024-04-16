import 'dart:developer';

import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/Extensions/responsive_extention.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/imports.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Presentation/Widgets/Dashboard/TodoHome/Components/dotted_widget.dart';

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
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
         // clipBehavior: Clip.hardEdge,
          child: DottedBorder(
            gap: 10,
            dashWidth: 10,
            child: Column(
        
              children: [
        
                AppText(todo!.title, style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 18)),
                DisplayFileImage(fileImage: todo!.image!, onDeleteTap: (){})
        
              ],
        
            ),
          ),
        ),
      ),
    );
  }
}
