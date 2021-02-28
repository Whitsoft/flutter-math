import 'dart:math';
import 'package:flutter/material.dart';
//import 'dart:ui';

const RD = 120;
const PTS = 1440;
const TPTS = 1440;

List<Offset> CIRCLEARRAY = [];
List<Offset> SINEARRAY = [];
List<Offset> TANARRAY = [];

void fillCircleArray(double XC, double YC, double RadC) {
  var P = Offset(0.0, 0.0);
  double X;
  double Y;
  double A;
  double B;
  double Ang;
  double Con;
  Con = 2.0 * pi / PTS;
  for (var i = 0; i < PTS; i++) {
    Ang = i * Con;
    X = XC + RadC * cos(Ang);
    Y = YC + RadC * sin(Ang);
    P = Offset(X, Y);
    CIRCLEARRAY.insert(i, P);
  }
}

double fillTanArray(double XC, double YC,) {
  var P = Offset(0.0, 0.0);
//  double Angdegree;
//  double XX;
 // double YY;
  double X;
  double Y;
  double A;
  double B;
  double Ang;
  double ATan;
  double Con;
  Con = 4.0 * pi / TPTS;
  for (var i = 0; i < TPTS; i++) {
    Ang = 1.0 * (i * Con);
    ATan = tan(Ang);
    X = XC + 150.0 / (TPTS + 1) * i;
    Y = YC - ATan * 5.0;
    P = Offset(X, Y);
  //  XX = X-XC;
 //   YY = Y -YC;
  //  Angdegree = Ang * 57.296;
 //   print("$i, $Angdegree, $XX, $YY");
    TANARRAY.insert(i, P);

  }
  return TANARRAY.last.dx;
}
/*
void fillTanArray(double XC, double YC,) {
  var P = Offset(0.0, 0.0);
  double X;
  double Y;
  double A;
  double B;
  double Ang;
  double ATan;
  double Con;
  Con = 2.0 * pi / TPTS;
  for (var i = 0; i < TPTS; i++) {
    Ang = 1.0 * (i * Con);
    ATan = tan(Ang);
    X = XC + 100.0 / (TPTS + 1) * i;
    Y = YC + -ATan * 5.0;
    P = Offset(X, Y);
    TANARRAY.insert(i, P);
  }
}
*/
double AngToRad(double Ang) {
  return Ang / 360.0 * 2.0 * pi;
}

double fillSineArray(double XC, double YC, XScale) {
  Offset p1;
  double xMid;

  var P = Offset(0.0, 0.0);
  double X;
  double Y;
  double A;
  double Ang;
  double ASin;
  double XInc = XScale/(PTS-1);
  double angInc = 8.0 * pi / PTS;
  for (var IDX = 0; IDX < PTS; IDX++) {
    Ang = IDX * angInc;
    A = 150.0 / (PTS + 1) * IDX;
    ASin = sin(Ang) * 50.0;
    X = XC + IDX * XInc;//.truncate();
    Y = YC - ASin;//.truncate();
    P = Offset(X, Y);
    SINEARRAY.add(P);
  }
  p1 = SINEARRAY.last;
  xMid = p1.dx;
  return(xMid - XC);
}
/*
void drawSine(Paint paint) {
  int X;
  int Y;
  for (int IDX = 0; IDX < PTS; IDX++) {
    X = SINEARRAY[IDX].x;
    Y = SINEARRAY[IDX].y;
    DrawingPainter;
    // drawPoint(Offset 5, Offset 5, Paint paint)
  }
}*/

//List<Offset> DrawingPoints;
/*class DrawingPainter extends CustomPainter {
  DrawingPainter({this.pointsList});
  List<Offset> pointsList;
  List<Offset> offsetPoints = List();

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  @override //  List<Offset> pointsList; void drawPoint(Offset p1, Paint paint)
  void paint(Canvas canvas, Size size) {
    Paint _paint;
    _paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    // void drawLine(Offset p1, Offset p2, Paint paint) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        canvas.drawLine(pointsList[i], pointsList[i + 1], _paint);
      } else if (pointsList[i] != null && pointsList[i + 1] == null) {
        offsetPoints.clear();
        offsetPoints.add(pointsList[i]);
        //offsetPoints.add(Offset(pointsList[i].points.dx + 0.1, pointsList[i].points.dy + 0.1));
        canvas.drawPoints(PointMode.points, offsetPoints, _paint);//  void drawPoints(PointMode pointMode, List<Offset> points, Paint paint
      } //else if
    } // for
  } //void paint
} //class
*/
/*
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.blue;
    paint.strokeWidth = 2;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );

    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 4, paint);
    canvas.drawCircle(
        Offset(size.width / 4, size.height / 4), size.width / 8, paint);
    paint.color = Colors.yellow;

    var path = Path();
    path.moveTo(size.width / 3, size.height * 3 / 4);
    path.lineTo(size.width / 2, size.height * 5 / 6);
    path.lineTo(size.width * 3 / 4, size.height * 4 / 6);
    path.close();

    paint.style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }
*/
@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
}