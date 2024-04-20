import 'package:flutter/material.dart';

class DottedBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final double gap;
  final double borderRadius;
  final double dashWidth;

  const DottedBorder({
     super.key,
    required this.child,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.gap = 4.0,
    this.borderRadius = 0.0,  this.dashWidth=4.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(

      painter: _DottedBorderPainter(
        color: color,
        strokeWidth: strokeWidth,
        gap: gap,
        dashWidth: dashWidth,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}

class _DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double borderRadius;
  final double dashWidth;

  _DottedBorderPainter( {
    this.color = Colors.black,
    this.dashWidth=4.0,
    this.strokeWidth = 1.0,
    this.gap = 4.0,
    this.borderRadius = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    path.moveTo(0, 0);
    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    final double dashGap = dashWidth;
    final double dashSpace = gap;
    final bgRect = Offset.zero & size;
    double distance = 0.0;
double totalGap=dashGap + dashSpace;

    while (distance < (size.width)) {
      path.moveTo(distance, 0);

if(distance+totalGap > (size.width))
  {
    // print(distance);
    // print(size.width);
    // print(totalGap);
    // print(distance+dashGap);
    // double leftDist=((distance+totalGap) - (size.width));
    // print(leftDist);
    print("in condition is true");
    path.lineTo(size.width, 0);
  }
else{
  path.lineTo(distance + dashGap, 0);
}

distance += totalGap;
      //canvas.dr(path, paint);
    }


    distance = 0.0;
    while (distance < size.height) {
      path.moveTo(0, distance);
      if(distance+totalGap > (size.height))
      {
        // print(distance);
        // print(size.width);
        // print(totalGap);
        // print(distance+dashGap);
        // double leftDist=((distance+totalGap) - (size.width));
        // print(leftDist);
        print("in condition is true");
        path.lineTo( 0,size.height);
      }
      else
        {
      path.lineTo(0, distance + dashGap);
        }
     // path.addRect(bgRect);
     // path.quadraticBezierTo(0, size.width, size.width, 0);
      distance += dashGap + dashSpace;
     // canvas.clipRect(bgRect);
     // canvas.drawPath(path, paint);
    }

    distance = 0.0;
    while (distance < size.width) {
      path.moveTo(distance, size.height);

      if(distance+totalGap > (size.width))
      {
        // print(distance);
        // print(size.width);
        // print(totalGap);
        // print(distance+dashGap);
        // double leftDist=((distance+totalGap) - (size.width));
        // print(leftDist);
        print("in condition is true");
        path.lineTo(size.width, size.height);
      }
      else {
        path.lineTo(distance + dashGap, size.height);
      }
      distance += dashGap + dashSpace;
      // canvas.drawPath(path, paint);
    }
    distance = 0.0;
    while (distance < size.height) {
      path.moveTo(size.width,distance);

      if(distance+totalGap > (size.height))
      {
        // print(distance);
        // print(size.width);
        // print(totalGap);
        // print(distance+dashGap);
        // double leftDist=((distance+totalGap) - (size.width));
        // print(leftDist);
        print("in condition is true");
        path.lineTo(size.width, size.height);
      }
      else{
      path.lineTo( size.width,distance + dashGap);}
      distance += dashGap + dashSpace;
      // canvas.drawPath(path, paint);
    }
    canvas.drawPath(path, paint);
canvas.clipRect(bgRect);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
