
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/imports.dart';

class AddDataForm extends StatefulWidget {
   const AddDataForm({super.key});

  @override
  State<AddDataForm> createState() => _AddDataFormState();
}

class _AddDataFormState extends State<AddDataForm> {
final TextEditingController nameController=TextEditingController();

  final TextEditingController emailController=TextEditingController();

 // List<String?> images=[];

   @override
  Widget build(BuildContext context) {
    return  StatefulBuilder(
      builder: (context,stt) {
        return IntrinsicHeight(
          child: Column(children: [
            20.y,
                    const AppText("Add Todo", style: TextStyle(fontWeight: FontWeight.w700)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomTextFieldWithOnTap(
                controller: nameController,
                hintText: 'Add Title', textInputType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [

                  const AppText("Add Images Any ", style: TextStyle(fontWeight: FontWeight.bold)),
                  GestureDetector(
                      onTap: () async {

                      await  TodoController().pickImages();
                     //    if(images.isNotEmpty)
                     //      {
                     //        MethodWidgets.instance.snackBar(context,text: 'Images Selected > ${images.length}');
                     //      }
                     // setState(() {
                     //
                     // });
                      },
                      child: const Icon(Icons.image,size: 40,)),
                ],
              ),
            ),

            12.y,
           ValueListenableBuilder(
        valueListenable: TodoController.imagesController,
             builder: (context,images,child){

               return images.isNotEmpty? SizedBox(
                  height: 100,
                  //width: 200,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return DisplayFileImage(
                        fileImage: images[index].toString(),
                        onDeleteTap: () {

                        },
                      );
                    },
                    separatorBuilder:
                        (BuildContext context, int index) {
                      return const SizedBox(
                        width: 5,
                      );
                    },
                  ),
                ):const SizedBox();
             }
           ),
            ValueListenableBuilder(
                valueListenable: TodoController.imagesController,

                builder: (context,images,ss) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      onSubmit(images);
                    },
                    child: AppText('Submit', style: Styles.circularStdRegular(context),),
                  ),
                );
              }
            ),



          ],),
        );
      }
    );
  }

  void onSubmit(List<String?>images) {


   if(nameController.text.isNotEmpty && images.isNotEmpty){
     TodoItem td= TodoItem(title: nameController.text, image: images[0]);

     TodoController.todoController.value.add(td);
     TodoController.todoController.notifyListeners();
     nameController.clear();
     images=[];
     setState(() {

     });
     Data.app.serviceNavigatorLocator<Navigate>().pop(context);
   }



  }
}
