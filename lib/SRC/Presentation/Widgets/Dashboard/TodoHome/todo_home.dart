import 'dart:developer';

import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/Extensions/responsive_extention.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/imports.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/strings.dart';

import 'Components/addDataForm.dart';
import 'Components/dotted_widget.dart';
import 'Components/todocontainer.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Todo',
        onPressed: () async {
          dynamic i = 1.1;
          int s = i * i;

          // MethodWidgets.instance.dialog(context, child: const AddDataForm());
        },
        child: const Icon(Icons.add),
      ),


      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomPaint(
              painter: CustomDotMaker(gap: 1, dashedWidth: 20),
              child: Container(
                height: 300,
                width: 200,
                color: Colors.redAccent.shade100,
                child: const Center(child: Text('Dotted border')),
              ),
            ),
          ),
        ],
          

        ),

      );

  }


}

class CustomDotMaker extends CustomPainter {
  final double gap;
  final double dashedWidth;

  CustomDotMaker({super.repaint, required this.gap, required this.dashedWidth});

  @override
  void addListener(VoidCallback listener) {
    log('message');
    super.addListener(listener);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 0);

    //
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 10
      // ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;
    //
    //
    Offset ofxTop = const Offset(0, 0);
    Offset ofxBottom = Offset(0, size.height);
    Offset ofxLeft = const Offset(0, 0);
    Offset ofxRight = Offset(size.width, 0);
    while (ofxLeft.dy < size.height) {
      path.moveTo(ofxLeft.dx, ofxLeft.dy);
      if (ofxLeft.dy + dashedWidth + gap > size.height) {
        path.lineTo(ofxLeft.dx, size.height);
        ofxLeft = Offset(ofxLeft.dx, ofxLeft.dy + dashedWidth + gap);
      } else {
        path.lineTo(ofxLeft.dx, ofxLeft.dy + dashedWidth);
        ofxLeft = Offset(ofxLeft.dx, ofxLeft.dy + dashedWidth + gap);
      }
    }

    while (ofxTop.dx < size.width) {
      path.moveTo(ofxTop.dx, ofxTop.dy);
      if (ofxTop.dx + dashedWidth + gap > size.width) {
        path.lineTo(size.width, ofxTop.dy);
        ofxTop = Offset(ofxTop.dx + dashedWidth + gap, ofxTop.dy);
      } else {
        path.lineTo(ofxTop.dx + dashedWidth, ofxTop.dy);
        ofxTop = Offset(ofxTop.dx + dashedWidth + gap, ofxTop.dy);
      }
    }

    while (ofxRight.dy < size.height) {
      path.moveTo(ofxRight.dx, ofxRight.dy);
      if (ofxRight.dy + dashedWidth + gap > size.height) {
        path.lineTo(ofxRight.dx, size.height);
        ofxRight = Offset(ofxRight.dx, ofxRight.dy + dashedWidth + gap);
      } else {
        path.lineTo(ofxRight.dx, ofxRight.dy + dashedWidth);
        ofxRight = Offset(ofxRight.dx, ofxRight.dy + dashedWidth + gap);
      }
    }
    while (ofxBottom.dx < size.width) {
      path.moveTo(ofxBottom.dx, ofxBottom.dy);
      if (ofxBottom.dx + dashedWidth + gap > size.width) {
        path.lineTo(size.width, ofxBottom.dy);
        ofxBottom = Offset(ofxBottom.dx + dashedWidth + gap, ofxBottom.dy);
      } else {
        path.lineTo(ofxBottom.dx + dashedWidth, ofxBottom.dy);
        ofxBottom = Offset(ofxBottom.dx + dashedWidth + gap, ofxBottom.dy);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool? hitTest(Offset position) {
    log('here $position');
    return true;
  }
}
