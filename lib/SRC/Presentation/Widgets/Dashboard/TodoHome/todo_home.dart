import 'dart:developer';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/imports.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  ValueNotifier<double> i = ValueNotifier(1.0);
  ValueNotifier<Offset?> offset = ValueNotifier(null);
  @override
  void initState() {
    // changeval();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: AppText(
      //     "${AppStrings.welcome} ${Data.app.user?.name}",
      //     style: const TextStyle(),
      //   ),
      //   centerTitle: true,
      // ),
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
          ValueListenableBuilder(
            valueListenable: offset,
            builder: (context, value, child) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomPaint(
                painter: CustomDotMaker(gap: 4, dashedWidth: 10),
                size: const Size(300, 300),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeval() async {
    await Future.delayed(const Duration(milliseconds: 200));
    i.value = i.value < 200 ? i.value + 10 : 1;
    changeval();
  }
}

class CustomPainterWithHitTesting extends CustomPainter {
  final Offset movableOffset;
  final Function(Offset offset) onChange;
  CustomPainterWithHitTesting(this.movableOffset, this.onChange,
      {super.repaint});
  @override
  void paint(Canvas canvas, Size size) {
    log(movableOffset.toString());
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    path.moveTo(movableOffset.dx, movableOffset.dy);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainterWithHitTesting oldDelegate) {
    return true;
  }

  @override
  bool hitTest(Offset position) {
    onChange(position);
    return true;
  }
}

//Rectangle with should repaint
class CustomPainterWithShouldRepaint extends CustomPainter {
  final double i;

  CustomPainterWithShouldRepaint({super.repaint, required this.i});
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    path.moveTo(0, 30);
    path.quadraticBezierTo(i, 0, 30, 0);
    path.lineTo(size.width - 30, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(30, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 30);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainterWithShouldRepaint oldDelegate) {
    return oldDelegate.i != i;
  }
}

//Rectangle with radius
class CustomRectangleWithRadius extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 4, size.height / 4);
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, size.height / 2);
    path.lineTo(0, size.height / 2);

    // path.lineTo(size.width * .75, size.height);
    // path.lineTo(x, y);

    // path.quadraticBezierTo(0, 0, 30, 0);
    // path.lineTo(size.width - 30, 0);
    // path.quadraticBezierTo(size.width, 0, size.width, 30);
    // path.lineTo(size.width, size.height - 30);
    // path.quadraticBezierTo(
    //     size.width, size.height, size.width - 30, size.height);

    // path.lineTo(30, size.height);

    // path.quadraticBezierTo(
    //     size.width - 30, size.height, size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Rectangle 1st way
class CustomRectangle1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// //Rectangle 2nd way
// class CustomRectangle2 extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 3;
//     canvas.drawRect(Rect.fromLTRB(0.0, 0.0, size.width, size.height), paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

//Custom DOT
class CustomDotMaker extends CustomPainter {
  final double gap;
  final double dashedWidth;

  CustomDotMaker({super.repaint, required this.gap, required this.dashedWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 0);

    //
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      // ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;
    //
    //
    Offset ofxTop = const Offset(0, 0);
    Offset ofxBottom = Offset(0, size.height);
    Offset ofxLeft = const Offset(0, 0);
    Offset ofxRight = Offset(size.width, 0);

    //
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

    // while (ofxTop.dx < size.width) {
    //   path.moveTo(ofxTop.dx, ofxTop.dy);
    //   if (ofxTop.dx + dashedWidth + gap > size.width) {
    //     path.lineTo(size.width, ofxTop.dy);
    //     ofxTop = Offset(ofxTop.dx + dashedWidth + gap, ofxTop.dy);
    //   } else {
    //     path.lineTo(ofxTop.dx + dashedWidth, ofxTop.dy);
    //     ofxTop = Offset(ofxTop.dx + dashedWidth + gap, ofxTop.dy);
    //   }
    // }

    // while (ofxRight.dy < size.height) {
    //   path.moveTo(ofxRight.dx, ofxRight.dy);
    //   if (ofxRight.dy + dashedWidth + gap > size.height) {
    //     path.lineTo(ofxRight.dx, size.height);
    //     ofxRight = Offset(ofxRight.dx, ofxRight.dy + dashedWidth + gap);
    //   } else {
    //     path.lineTo(ofxRight.dx, ofxRight.dy + dashedWidth);
    //     ofxRight = Offset(ofxRight.dx, ofxRight.dy + dashedWidth + gap);
    //   }
    // }
    // while (ofxBottom.dx < size.width) {
    //   path.moveTo(ofxBottom.dx, ofxBottom.dy);
    //   if (ofxBottom.dx + dashedWidth + gap > size.width) {
    //     path.lineTo(size.width, ofxBottom.dy);
    //     ofxBottom = Offset(ofxBottom.dx + dashedWidth + gap, ofxBottom.dy);
    //   } else {
    //     path.lineTo(ofxBottom.dx + dashedWidth, ofxBottom.dy);
    //     ofxBottom = Offset(ofxBottom.dx + dashedWidth + gap, ofxBottom.dy);
    //   }
    // }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
