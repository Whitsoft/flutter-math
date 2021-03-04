
import 'dart:ui';
import 'dart:math';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'trigPoints.dart' ;
import 'size_config.dart';
import 'package:catex/catex.dart';
import 'dart:developer' as dev;
//import 'widgets.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


const CircleCenterX = 180.0;
const CircleCenterY = 150.0;
const CircleRadius = 120.0;
const SinCenterX = 60.0;
const SinCenterY = 400.0;
const TanCenterX = 360.0;
const TanCenterY = 400.0;
const SinScaleX = 240.0;
double buttonSize = 38;

const activeIcon = Icons.wb_sunny_sharp;
double xHeight = 0.0;
double xWidth = 0.0;
int BUTTONSTATE = 0;

//var screenWidth = 0.1;
var screenHeight = 0.1;
int angle = 0;
int ANGLE = 0;
int ANGINC = 5;
var littleRadius = 5.0;
var upIcon = Icons.arrow_upward_rounded;
var downIcon = Icons.arrow_downward_rounded;
var incIcon = upIcon;
var upIcon1 = Icons.arrow_upward_rounded;
var downIcon1 = Icons.arrow_downward_rounded;
var incIcon1 = upIcon1;

double HBlock = 0.0;//
double VBlock = 0.0;
double ScreenWidth = 0.1;
double ScreenHeight = 0.1;
double XScale = 1.0;
double YScale = 1.0;

var incVal = '5';
var angVal = '0';
var DX = fillSineArray(SinCenterX, SinCenterY, SinScaleX);
Offset START = Offset(40.0,40.0);
Offset END = Offset(120.0,120.0);
var LEG = 10.0;
bool oldSelected = false;
//SinCenterX+DX/2.0;
Offset CircleCenter = Offset(CircleCenterX,CircleCenterY);
Offset  SinCirPt = Offset(CircleCenterX,SinCenterY);
var screenWidth = endX;
double scaleX;
var endX = TanCenterX +fillTanArray(TanCenterX, TanCenterY);
BuildContext sContext;

List<String> get equations => [
  r'\text{Hello, World!}',
  r'\mu =: \sqrt{x}',
  r'\eta = 7^\frac{4}{2}',
  r'\epsilon = \frac 2 {3 + 2}',
  r'x_{initial} = \frac {20x} {\frac{15}{3}}',
  // ignore: no_adjacent_strings_in_list
  r'\colorbox{red}{bunt} \boxed{ '
  r'\rm{\sf{\bf{'
  r'\textcolor{red} s \textcolor{pink}  i \textcolor{purple}m '
  r'\textcolor{blue}p \textcolor{cyan}  l \textcolor{teal}  e} '
  r'\textcolor{lime}c \textcolor{yellow}l \textcolor{amber} u '
  r'\textcolor{orange} b}}}',
  r'\TeX',
  r'\LaTeX',
  r'\KaTeX',
  r'\CaTeX',
  'x_i=a^n',
  r'\hat{y} = H y',
  r'12^{\frac{\frac{2}{7}}{1}}',
  r'\varepsilon = \frac{\frac{2}{1}}{3}',
  r'\alpha\beta\gamma\delta',
  // ignore: no_adjacent_strings_in_list
  r'\colorbox{black}{\textcolor{white} {black} } \colorbox{white} '
  r'{\textcolor{black} {white} }',
  r'\alpha\ \beta\ \ \gamma\ \ \ \delta',
  r'\epsilon = \frac{2}{3 + 2}',
  r'\tt {type} \textcolor{teal}{\rm{\tt {writer} }}',
  'l = a * t * e * x',
  r'\rm\tt{sp   a c  i n\ \bf\it g}',
  r'5 = 1 \cdot 5',
  '{2 + 3}+{3             +4    }=12',
  r'\backslash \leftarrow \uparrow \rightarrow  \$',
  r'42\uparrow 99\Uparrow\ \  19\downarrow 1\Downarrow',
  '5x =      25',
  r'10\cdot10 = 100',
  'a := 96',
];

//*******************************************************
// Local class _TextFieldEquation Stateful
//*******************************************************
class _TextFieldEquation extends StatefulWidget {
  const _TextFieldEquation({Key key}) : super(key: key);
  @override
  State createState() {
    return _TextFieldEquationState();
  }
}

//********************************************************
// Local class _TextFieldEquation State _TextFieldEquation
//********************************************************
class _TextFieldEquationState extends State<_TextFieldEquation> {
  TextEditingController _controller;  //variable
  bool _input;  //variable
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _input = true;
  } //End initState

  @override
  Widget build(BuildContext context) {  //get some text from a box
    if (_input) {
      return TextField(
        controller: _controller,
        autocorrect: false,
        enableSuggestions: false,
        onSubmitted: (_) {
          setState(() {
            _input = false;
          } //End setState body
          ); //End setState
        }, //End onSubmitted
      );  //End TextField
    } //End Widget build

    return InkWell(
      onTap: () {
        setState(() {
          _input = true;
        } //End setState Body
        ); //End setState
      }, //end onTap
      child: CaTeX(_controller.text),
    );// End inkWell
  }  //End build context
} //End class _TextFieldEquationState


class CreateEquation extends StatefulWidget {
  const CreateEquation(this.equation, {Key  key}) : super(key: key);
  final String equation;
  @override
  State createState() => _CreateEquationState();
} //End CreateEauation Stateful Widget

class _CreateEquationState extends State<CreateEquation> {
  @override
  void initState() {
    super.initState();
  } //End initState


  Widget buildEquation(BuildContext context) {  //function returning a widget
    print('Hello');
    return CaTeX(equations[0]);
    //return CaTeX(widget.equation);
  } // End buildEquation

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: _toggle,
      child: buildEquation(context),
    );  //End return inkWell
    print(context);
  } //End build context
} // End class _CreateEquationState

Widget build(BuildContext context) {
  return CaTeX(r'\text{Your equation: } 40 + 2 = 42');
}

void main() {
  fillCircleArray(CircleCenterX, CircleCenterY, CircleRadius);
  fillTanArray(TanCenterX, TanCenterY);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(TrigApp());
  }
  );
  runApp(TrigApp());
}

class TrigApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //  final sizeX = MediaQuery.of(context).size.width;
    //  final sizeY = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
          buttonTheme: ButtonThemeData(
            minWidth: 44.0,
            height: 46.0,
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var Degrees = 0;
  var text = ' ';
  int angle = 0;
  List aPointList = getDottedLine(START, END, LEG);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenWidth = SizeConfig.screenWidth * 1.5;
    ScreenHeight = SizeConfig.screenHeight;
    YScale = ScreenHeight / 955.0;
    XScale = ScreenWidth / 500.0;
  //  screenWidth = (MediaQuery.of(context).size.width)*1.5;
 //   screenHeight = MediaQuery.of(context).size.height;
    if (ScreenWidth < (endX+5))
      scaleX = ScreenWidth/(endX+5);
    else
      scaleX = 1.0;
   // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:40,
        title: Text('  Increment         Angle'),
        backgroundColor: Color(0xFF444444),
         actions: <Widget>[

//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.arrow_forward),
//        backgroundColor: Colors.deepPurple,
//        foregroundColor: Colors.white,
      IconButton(
        icon: const Icon(Icons.arrow_forward),
        tooltip: 'Next page',
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(
              builder: (context) {
                return PythPage();
              } //Builder context
          ),
          ); //Navigator push
        }, //onPressed
      ),
     ]
      ),

      body: ListView(children: <Widget>[
        //   SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,

        Row(
         //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisSize:MainAxisSize.max,
            children: <Widget>[

        Flexible(
             flex: 2,
             fit: FlexFit.loose,
             child:
             ElevatedButton.icon(
               //edgeInsets.all(1.0),
               icon: Padding(
                 padding: EdgeInsets.only(left:8),
                 child:  Icon(MdiIcons.minusThick, color:Colors.black),
               ),
               label: Text(''),
               style: ElevatedButton.styleFrom(
                 minimumSize:Size(46.0,46.0),
                 padding: EdgeInsets.symmetric(
                   vertical: 1,
                   horizontal: 8,
                 ),
                 shape: CircleBorder(),
                 primary: Colors.blue,
               ),

               onPressed: (){ incIcon1 = downIcon;
               if (ANGINC <= 1)
                 ANGINC = 1;
               else
                 ANGINC--;
               setState((){_stateChgContainer(ANGINC.toString());});
               }, // onPressed
             ),
           ),

        //   _stateChgButton1 (ANGINC.toString()),

          Container(
              width: 46,
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.blue, width: 2, style: BorderStyle.solid),
                  left: BorderSide(color: Colors.blue, width: 2, style: BorderStyle.solid),
                  bottom: BorderSide(color: Colors.blue, width: 2, style: BorderStyle.solid),
                  right: BorderSide(color: Colors.blue, width: 2, style: BorderStyle.solid),
                ),
              ),
              child: Center(
                  child: Text(ANGINC.toString(), style: TextStyle(fontSize: 14))

              ),
            ),

          Flexible(
             flex: 2,
             fit: FlexFit.loose,
             child:
             ElevatedButton.icon(
               //edgeInsets.all(1.0),
               icon: Padding(
                 padding: EdgeInsets.only(left:8),
                 child:  Icon(MdiIcons.plusThick, color:Colors.black),
               ),
               label: Text(''),
               style: ElevatedButton.styleFrom(
                 minimumSize:Size(46.0,46.0),
                 padding: EdgeInsets.symmetric(
                   vertical: 1,
                   horizontal: 7,
                 ),
                 shape: CircleBorder(),
                 primary: Colors.blue,
               ),

               onPressed: () {
                 if (ANGINC > 90)
                   ANGINC = 1;
                 else
                   ANGINC++;
                 setState(() {
                   _stateChgContainer(ANGINC.toString());
                 });
               }, //onPressed
             ),
           ),


           Flexible(
             flex: 2,
             fit: FlexFit.loose,
             child:
                ElevatedButton.icon(
                //edgeInsets.all(1.0),
               icon: Padding(
                   padding: EdgeInsets.only(left:8),
                   child:  Icon(MdiIcons.minusThick, color:Colors.black),
               ),
               label: Text(''),
               style: ElevatedButton.styleFrom(
                 minimumSize:Size(46.0,46.0),
                 padding: EdgeInsets.symmetric(
                     vertical: 1,
                     horizontal: 8,
                 ),
                 shape: CircleBorder(),
                 primary: Colors.green,
               ),

                  onPressed: () {
                    if ((angle - ANGINC) > -360)
                        angle = (angle - ANGINC);
                    else
                       angle = -360;
                    ANGLE = angle;
                    setState((){_stateChgContainer(ANGLE.toString());});
                   }, //onPressed
            ),
           ),


        Container(
              width: 46,
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.green, width: 2, style: BorderStyle.solid),
                  left: BorderSide(color: Colors.green, width: 2, style: BorderStyle.solid),
                  bottom: BorderSide(color: Colors.green, width: 2, style: BorderStyle.solid),
                  right: BorderSide(color: Colors.green, width: 2, style: BorderStyle.solid),
                ),
              ),
              child: Center(

                  child: Text(angle.toString(), style: TextStyle(fontSize: 12))
              ),
            ),

           Flexible(
             flex: 2,
             fit: FlexFit.loose,
             child:
             ElevatedButton.icon(
               //edgeInsets.all(1.0),
               icon: Padding(
                 padding: EdgeInsets.only(left:8),
                 child:  Icon(MdiIcons.plusThick, color:Colors.black),
               ),
               label: Text(''),
               style: ElevatedButton.styleFrom(
                 minimumSize:Size(46.0,46.0),
                 padding: EdgeInsets.symmetric(
                   vertical: 1,
                   horizontal: 8,
                 ),
                 shape: CircleBorder(),
                 primary: Colors.green,
               ),
             onPressed: () { incIcon = upIcon;
             if ((angle + ANGINC) < 360)
                angle = (angle + ANGINC);
             else
               angle = 360;
             ANGLE = angle;
             setState((){_stateChgContainer(ANGINC.toString());});
              }, // onPressed
           ),
         ),

         ]),
   //   ),



          Container(
           margin: EdgeInsets.only(top: 0.0),
           padding: EdgeInsets.all(0.0),
           decoration: BoxDecoration(
             color: Colors.yellow.withOpacity(0.02),
             borderRadius: BorderRadius.circular(5.0),
           ),
          // width: 400,
          // height: 800,
          /*  child: DefaultTextStyle.merge(
              style: const TextStyle(fontSize: 48),
              child:  CaTeX(equations[4]),
            ),*/
             child: CustomPaint(painter:OpenPainter(100,100,10)),
         ),
      ]),
    );
  }
}

  Container _stateChgContainer(String Angle1) {
  var affectedContainer = new Container(
    width: 48,
    height: 40,
    decoration: BoxDecoration(
       border: Border(
         top: BorderSide(color: Colors.blue, width: 2, style: BorderStyle.solid),
         left: BorderSide(
           color: Colors.blue, width: 2, style: BorderStyle.solid),
         bottom: BorderSide(
           color: Colors.blue, width: 2, style: BorderStyle.solid),
         right: BorderSide(
         color: Colors.blue, width: 2, style: BorderStyle.solid),
       ),
    ),
    child: Center(
       child: Text(Angle1, style: TextStyle(fontSize: 14))
    ),
  );
  return affectedContainer;
  }




class OpenPainter extends CustomPainter {
  double sHeight = 100;
  double sWidth = 100;
  double sUnits = 10;
//constructor

  OpenPainter(double sHeight, double sWidth, double sUnits ) {
    this.sHeight = sHeight;
    this.sWidth = sWidth;
    this.sUnits = sUnits;
  }

    // CreateEquation CC = new CreateEquation(equation[0]);
//class OpenPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
      if (scaleX < 0.999)
        canvas.scale(scaleX);
      var paint1 = Paint()
        ..color = Colors.blueAccent //Color(0xff63aa65)
      //  ..strokeCap = StrokeCap.round //rounded points
        ..strokeWidth = 2;
      //  ..strokeCap = StrokeCap.round //rounded points
      var paintLine = Paint()
        ..color = Colors.black //Color(0xff63aa65)
        ..strokeWidth = 1;
      var paintCircle = Paint()
        ..color = Colors.black //Color(0xff63aa65)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      var paintDotted = Paint()
        ..color = Colors.black87 //Color(0xff63aa65)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round //rounded points
        ..strokeWidth = 0.6;

      //  canvas.drawLine(Offset(5.0,5.0),Offset(1.0,screenHeight-1.0),  paintLine);   //list of points
      //  canvas.drawLine(Offset(0.1,screenHeight-0.1),Offset(screenWidth-0.1,screenHeight-0.1),  paintLine);   //list of points

      //canvas.drawLine(Offset(screenWidth-1.0,screenHeight-1.0),Offset(screenWidth-500,1.0), paintLine);   //list of points

      // canvas.drawLine(Offset(screenWidth-0.1,0.1),Offset(0.1, 0.1),  paintLine);   //list of points
      //list of points
      Offset P1 = Offset(SinCenterX - 10.0, SinCenterY);
      Offset P2 = Offset(SinCenterX + DX + 10.0, SinCenterY);
      Offset P3 = Offset(SinCenterX + DX / 2.0, SinCenterY - 75.0);
      Offset P4 = Offset(SinCenterX + DX / 2.0, SinCenterY + 75.0);
      Offset PTan1 = Offset(TanCenterX - 15.0, TanCenterY);
      Offset PTan2 = Offset(TanCenterX + 165.0, TanCenterY);
      Offset PTan3 = Offset(TanCenterX + 75.0, TanCenterY - 250.0);
      Offset PTan4 = Offset(TanCenterX + 75.0, TanCenterY + 250.0);
      var points = CIRCLEARRAY;
      //draw circle on canvas
      canvas.drawPoints(PointMode.points, points, paint1);
      points = SINEARRAY;
      //draw sine points on canvas
      canvas.drawPoints(PointMode.points, points, paint1);

      points = TANARRAY;
      //draw tan points on canvas
      canvas.drawPoints(PointMode.points, points, paint1);

      canvas.drawLine(P1, P2,
          paintLine); //Draws a line from point 1 to point 2, with the given paint.
      canvas.drawLine(P3, P4, paintLine);
      canvas.drawLine(PTan1, PTan2, paintLine);
      canvas.drawLine(PTan3, PTan4, paintLine);
      PTan3 = Offset(TanCenterX + 56, TanCenterY - 310.0);
      PTan4 = Offset(TanCenterX + 56, TanCenterY + 310.0);
      drawDottedLine(canvas, PTan3, PTan4, 8.0,paintDotted);
      PTan3 = Offset(TanCenterX + 18, TanCenterY - 310.0);
      PTan4 = Offset(TanCenterX + 18, TanCenterY + 310.0);
      drawDottedLine(canvas, PTan3, PTan4, 8.0,paintDotted);
      PTan3 = Offset(TanCenterX + 94, TanCenterY - 310.0);
      PTan4 = Offset(TanCenterX + 94, TanCenterY + 310.0);
      drawDottedLine(canvas, PTan3, PTan4, 8.0,paintDotted);
      PTan3 = Offset(TanCenterX + 132, TanCenterY - 310.0);
      PTan4 = Offset(TanCenterX + 132, TanCenterY + 310.0);
      drawDottedLine(canvas, PTan3, PTan4, 8.0,paintDotted);
      paintText(Offset(30,517),canvas, size, 20, Colors.black, "Sine =   " );
      paintText(Offset(130,500),canvas, size, 20, Colors.red, "Opposite" );
      // canvas.drawLine(Offset(127,528), Offset(240,528), paintLine);
      paintText(Offset(130,532),canvas, size, 20, Colors.black, "Hypotenuse" );
      paintText(Offset(30,587),canvas, size, 20, Colors.black, "Tangent = " );
      paintText(Offset(130,570),canvas, size, 20, Colors.red, "Opposite" );
      paintText(Offset(130,602),canvas, size, 20, Colors.green, "Adjacent" );
      double angFloat= 1.0*ANGLE;
      drawTriangle(canvas,CircleCenter, CircleRadius, angFloat);
      drawSinCircle(canvas, angFloat, littleRadius,  paintCircle);
      drawTanCircle(canvas, angFloat, littleRadius,  paintCircle);
      CreateEquation(equations[0]);
      double AngRad;
      AngRad = angFloat * pi/180.0;
      double tanRadAngle = tan(AngRad);
      double sinRadAngle = sin(AngRad);
      String tanText = 'Undefined';
      double tmp = tan(ANGLE);
      String sinText = sinRadAngle.toStringAsFixed(3);
      paintText(Offset(275,516),canvas,size,20,Colors.black, sinText);
      double AbsAngle = angFloat.abs();
      if ((90.0 - AbsAngle).abs()  < 0.01)
        tanText = 'Undefined';
      else if ((270.0 - AbsAngle).abs() < 0.01)
        tanText = 'Undefined';
      else {
        tmp = tan(angFloat);
        if (tmp.abs() > 300.0)
          tanText = 'Undefined';
        else
          tanText = tanRadAngle.toStringAsFixed(3);
      }

      paintText(Offset(275,586),canvas,size,20,Colors.black, tanText);
    }
    @override
    bool shouldRepaint(CustomPainter oldDelegate) => true;
  }
//}


void drawSinCircle(Canvas canvas, double angle, double radius,  Paint paintCir) {
  int IDX;
  IDX = (((PTS / 720) * ANGLE)+720).toInt();
  if (IDX > 1439)
    IDX = 1439;
  if (IDX < 0)
    IDX = 0;
  Offset CirCtr = SINEARRAY[IDX];
  canvas.drawCircle(CirCtr, radius, paintCir);
}

void drawTanCircle(Canvas canvas, double angle, double radius,  Paint paintCir) {
  int IDX;
  IDX = (((PTS / 720) * ANGLE)+720).toInt();
  if (IDX > 1439)
    IDX = 1439;
  if (IDX < 0)
    IDX = 0;
  Offset CirCtr = TANARRAY[IDX];
  canvas.drawCircle(CirCtr, radius, paintCir);
}

//***********************************************************************
// Function to get a list of points start point, end point, dash length *
//***********************************************************************
List getDottedLine(Offset start, Offset end, double leg) {
  // returns a list of points
  List<Offset> pointsList = new List();
  double lineDX = start.dx;
  double lineDY = start.dy;
  Offset tempPoint;
  tempPoint = Offset(lineDX, lineDY);
  double lineDistance = (end - start).distance;
  var legs = lineDistance / leg;
  double ldx = (end.dx - start.dx) / legs;
  double ldy = (end.dy - start.dy) / legs;
  for (int IDX = 0; IDX < legs ; IDX ++) {
    pointsList.add(tempPoint);
    lineDX = tempPoint.dx + ldx;
    lineDY = tempPoint.dy + ldy;
    tempPoint = Offset(lineDX, lineDY);
  }
  return pointsList;
}

//***********************************************************************
// Function to paint dotted ,start point, end point, dash length, paint *              *
//***********************************************************************
void drawDottedLine(Canvas canvas, Offset start, Offset end, double leg, Paint paintDash) {
  List<Offset> pointList = getDottedLine(start, end, leg);
  assert(pointList != null);
  pointList.forEach((item) {assert(item !=null);});
  var numPts = pointList.length;
  Offset P1;
  Offset P2;
  if (numPts > 1) {
    //if (numPts.isOdd)
    //   pointList.remove(numPts);
    numPts = numPts - 1;
    for (int IDX = 0; IDX < numPts - 1; IDX++) {
      P1 = pointList[IDX];
      P2 = pointList[IDX + 1];
      if (IDX.isOdd)
        canvas.drawLine(P1, P2, paintDash);
    }
  }
}

void drawTriangle(Canvas canvas, Offset center, double radius, double angle) {
  var paintRed = Paint()
    ..color = Colors.red //Color(0xff63aa65)
  //  ..strokeCap = StrokeCap.round //rounded points
    ..strokeWidth = 3;

  var paintGreen = Paint()
    ..color = Colors.green //Color(0xff63aa65)
  //  ..strokeCap = StrokeCap.round //rounded points
    ..strokeWidth = 3;

  var paintBlack = Paint()
    ..color = Colors.black //Color(0xff63aa65)
  //  ..strokeCap = StrokeCap.round //rounded points
    ..strokeWidth = 2;


  var paintCircle = Paint()
    ..color = Colors.black //Color(0xff63aa65)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;


  double ang = angle * pi / 180.0;
  double Hypotenuse = radius;
  double opp = sin(ang) * Hypotenuse;
  double adj = cos(ang) * Hypotenuse;
  Offset axisPoint = Offset(center.dx + adj,center.dy);
  Offset endPoint  = Offset(center.dx + adj, center.dy - opp);
  canvas.drawLine(center,endPoint, paintBlack);
  canvas.drawLine(center,axisPoint, paintGreen);
  canvas.drawLine(axisPoint,endPoint,paintRed);
  canvas.drawCircle(endPoint, littleRadius, paintCircle);
}

/*void paintText( Offset wordOffset, Canvas canvas, Size size, double fontsize, Color fontColor, String words) {
  final textStyle = TextStyle(
    color: fontColor,
    fontSize: fontsize,
  );

  final textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(
    minWidth: 0,
    maxWidth: size.width,
  );

  final offset = wordOffset;
  textPainter.paint(canvas, offset);
}*/

class Device {
  static bool get isMobile => isAndroid || isIOS;
  static bool get isWindows => Platform.isWindows;
  static bool get isLinux => Platform.isLinux;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isFuchsia => Platform.isFuchsia;
  static bool get isIOS => Platform.isIOS;
}
//******************************************************
// Pythagorus
//******************************************************

class PythPage extends StatefulWidget {
  @override
  _PythPageState createState() => _PythPageState();
}

class _PythPageState extends State<PythPage> {
//double width = 300.0;
//double height = 150.0;
  void stateChgButton(int buttonState) {
    BUTTONSTATE = BUTTONSTATE &(buttonState);
    BUTTONSTATE = BUTTONSTATE ^(buttonState);// ^( is XOR
    print(BUTTONSTATE);
  }
  @override
  Widget build(BuildContext context) {
    final  screenWidth = (MediaQuery.of(context).size.width);
    final  screenHeight = MediaQuery.of(context).size.height;
    final screenUnits = 50.0;//screenWidth/12.0;
    xHeight = screenHeight;
    xWidth = screenWidth;

   // var lowerCP = OpenPainter(screenHeight,screenWidth,screenUnits);
    //   var canvasPaint = OpenPainter(screenHeight,screenWidth,screenUnits);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:40,
        title: Text(' Pythagorus  Theorem'),
        backgroundColor: Color(0xFF444444),
      ),
      body: Wrap(children: <Widget>[

      Padding(
      padding: EdgeInsets.all(2.0),

        child: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
          child: CustomMultiChildLayout(
            delegate: _customMultiChildLayoutDelegate(maxHeight: screenHeight, maxWidth: screenWidth,sUnits:screenUnits), // We will add delegate in next step
            children: <Widget>[

              LayoutId(
                id: 1,
                child:  ElevatedButton.icon(
                  //edgeInsets.all(1.0),
                  icon: Padding(
                    padding: EdgeInsets.only(left:8),
                    child:  Icon(activeIcon, color:Colors.black),
                  ),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    minimumSize:Size(buttonSize,buttonSize),
                    padding: EdgeInsets.only(
                    ),
                    shape: CircleBorder(),
                    primary: Colors.green,
                  ),
                  onPressed: (){
                    setState((){stateChgButton(1);});
                  }, // onPressed
                ),
              ),
              LayoutId(
                id: 2,
                child:  ElevatedButton.icon(
                  //edgeInsets.all(1.0),
                  icon: Padding(
                    padding: EdgeInsets.only(left:8),
                    child:  Icon(activeIcon, color:Colors.black),
                  ),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    minimumSize:Size(buttonSize,buttonSize),
                    padding: EdgeInsets.only(
                    ),

                    shape: CircleBorder(),
                    primary: Colors.red,
                  ),
                  onPressed: (){
                    setState((){stateChgButton(2);});
                  }, // onPressed
                ),
              ),
              LayoutId(
                id: 3,
                child:  ElevatedButton.icon(
                  //edgeInsets.all(1.0),
                  icon: Padding(
                    padding: EdgeInsets.only(left:8),
                    child:  Icon(activeIcon, color:Colors.black),
                  ),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    minimumSize:Size(buttonSize,buttonSize),
                    padding: EdgeInsets.only(
                    ),
                    shape: CircleBorder(),
                    primary: Colors.yellow,
                  ),
                  onPressed: (){
                    setState((){stateChgButton(4);});
                  }, // onPressed
                ),
              ),
              LayoutId(
                id: 4,
                child:  ElevatedButton.icon(
                  //edgeInsets.all(1.0),
                  icon: Padding(
                    padding: EdgeInsets.only(left:8),
                    child:  Icon(activeIcon, color:Colors.black),
                  ),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    minimumSize:Size(buttonSize,buttonSize),
                    padding: EdgeInsets.only(
                    ),

                    shape: CircleBorder(),
                    primary: Colors.blue,
                  ),
                  onPressed: (){
                    setState((){stateChgButton(8);});
                  }, // onPressed
                ),
              ),
              LayoutId(
                id: 5,
                child: Container(
                  child: CustomPaint(painter:PythagorusPainter(screenHeight,screenWidth,screenUnits)),
                  height: screenHeight,
                  width: screenWidth,
                ),
              ),

            ],
          ),
        )
    ),
    ]
    ),
    );
  }
}

class _customMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  final maxHeight;
  final maxWidth;
  final sUnits;
  _customMultiChildLayoutDelegate({this.maxHeight, this.maxWidth, this.sUnits});

  @override
  void performLayout(Size size) {
    if (hasChild(1)) {
      layoutChild(1, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      // Center of the box
      double dx = 0.2*sUnits;
      double dy = 8.8*sUnits;
      positionChild(1, Offset(dx, dy));
    }
    if (hasChild(2)) {
      layoutChild(2, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      //Top left of the box
      double dx = 0.2*sUnits;
      double dy = 9.8*sUnits;
      // double dy = 9.4*sUnits;

      positionChild(2, Offset(dx, dy));
    }
    if (hasChild(3)) {
      layoutChild(3, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      // Top right of the box
      double dx = 0.2*sUnits;
      double dy = 10.8*sUnits;
      //  double dy = 10.2*sUnits;


      positionChild(3, Offset(dx, dy));
    }
    if (hasChild(4)) {
      layoutChild(4, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      // bottom right of the box
      double dx = 0.2*sUnits;
      double dy = 11.8*sUnits;
      //     double dy = 11.0*sUnits;

      positionChild(4, Offset(dx, dy));
    }
    if (hasChild(5)) {
      layoutChild(5, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      CustomPaint(painter:OpenPainter(xHeight,xWidth,sUnits));
      //bottom left of the box
      double dx = sUnits;//-(maxWidth/2);
      double dy = 0.0;//((maxHeight * 2) + (maxHeight / 2));
      positionChild(5, Offset(dx, dy));
    }
  }
  @override
  bool shouldRelayout(_customMultiChildLayoutDelegate oldDelegate) {
    return (maxHeight != oldDelegate.maxHeight || maxWidth != oldDelegate.maxWidth);
  }
}

class PythagorusPainter extends CustomPainter {
  double sHeight = 100;
  double sWidth = 100;
  double sUnits = 10;
//constructor

  PythagorusPainter(this.sHeight, this.sWidth, this.sUnits );

  @override
  void paint(Canvas canvas, Size size) {
    //  canvas.scale(XScale,YScale);
    var paintAdjacent = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    var paintOpposite = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;


    var fillShape = Paint()
      ..color = Colors.grey[300]
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    var eraseShape = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    var paintTriangle = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    var paintLine = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;



    //4 corners big square
    Offset p1 = Offset(8.1 * sUnits, 8.5 * sUnits); //Rite bottom rite angle
    Offset p2 = Offset(0.1 * sUnits, 8.5 * sUnits); //Left Bottom rite angle
    Offset p3 = Offset(0.1 * sUnits, 0.5 * sUnits); //Left upper rite angle
    Offset p4 = Offset(8.1 * sUnits, 0.5 * sUnits); //Rite upper rite angle
    //mid points triangle vertex
    Offset pMid1 = Offset(3.1 * sUnits, 8.5 * sUnits); //lower
    Offset pMid2 = Offset(0.1 * sUnits, 3.5 * sUnits); //left
    Offset pMid3 = Offset(5.1 * sUnits, 0.5 * sUnits); //upper
    Offset pMid4 = Offset(8.1 * sUnits, 5.5 * sUnits); //rite


    //Rite bottom triangle
    Path path1 = Path();
    path1.moveTo(pMid1.dx, pMid1.dy);
    path1.lineTo(p1.dx, p1.dy);
    path1.lineTo(pMid4.dx, pMid4.dy);
    path1.close();

    //Left bottom triangle
    Path path2 = Path();
    path2.moveTo(pMid1.dx, pMid1.dy);
    path2.lineTo(pMid2.dx, pMid2.dy);
    path2.lineTo(p2.dx, p2.dy);
    path2.close();

    //Left top triangle
    Path path3 = Path();
    path3.moveTo(pMid2.dx, pMid2.dy);
    path3.lineTo(p3.dx, p3.dy);
    path3.lineTo(pMid3.dx, pMid3.dy);
    path3.close();

    //Rite top triangle
    Path path4 = Path();
    path4.moveTo(pMid3.dx, pMid3.dy);
    path4.lineTo(p4.dx, p4.dy);
    path4.lineTo(pMid4.dx, pMid4.dy);
    path4.close();

    // Big square
    Path pathBigSquare = Path();
    pathBigSquare.moveTo(p1.dx, p1.dy);
    pathBigSquare.lineTo(p2.dx, p2.dy);
    pathBigSquare.lineTo(p3.dx, p3.dy);
    pathBigSquare.lineTo(p4.dx, p4.dy);
    pathBigSquare.close();

    // Small square
    Path pathSmSquare = Path();
    pathSmSquare.moveTo(pMid1.dx, pMid1.dy);
    pathSmSquare.lineTo(pMid2.dx, pMid2.dy);
    pathSmSquare.lineTo(pMid3.dx, pMid3.dy);
    pathSmSquare.lineTo(pMid4.dx, pMid4.dy);
    pathSmSquare.close();


    // Small square lines
    Path lineSmSquare = Path();
    lineSmSquare.moveTo(pMid1.dx, pMid1.dy);
    lineSmSquare.lineTo(pMid2.dx, pMid2.dy);
    lineSmSquare.lineTo(pMid3.dx, pMid3.dy);
    lineSmSquare.lineTo(pMid4.dx, pMid4.dy);
    lineSmSquare.close();


    Path adjacent = Path();
    adjacent.moveTo(pMid1.dx, pMid1.dy);
    adjacent.lineTo(p1.dx, p1.dy);
    adjacent.moveTo(pMid2.dx, pMid2.dy);
    adjacent.lineTo(p2.dx, p2.dy);
    adjacent.moveTo(pMid3.dx, pMid3.dy);
    adjacent.lineTo(p3.dx, p3.dy);
    adjacent.moveTo(pMid4.dx, pMid4.dy);
    adjacent.lineTo(p4.dx, p4.dy);

    Path opposite = Path();
    opposite.moveTo(pMid1.dx, pMid1.dy);
    opposite.lineTo(p2.dx, p2.dy);
    opposite.moveTo(pMid2.dx, pMid2.dy);
    opposite.lineTo(p3.dx, p3.dy);
    opposite.moveTo(pMid3.dx, pMid3.dy);
    opposite.lineTo(p4.dx, p4.dy);
    opposite.moveTo(pMid4.dx, pMid4.dy);
    opposite.lineTo(p1.dx, p1.dy);


    void fillTriangle() {
      canvas.drawPath(pathBigSquare, eraseShape);
      canvas.drawPath(pathBigSquare, eraseShape);
      canvas.drawPath(path1, fillShape);
      canvas.drawPath(path2, eraseShape);
      canvas.drawPath(path3, eraseShape);
      canvas.drawPath(path4, eraseShape);
    }
    void fillTriangles() {
      canvas.drawPath(pathBigSquare, eraseShape);
      canvas.drawPath(pathSmSquare, eraseShape);
      canvas.drawPath(path1, fillShape);
      canvas.drawPath(path2, fillShape);
      canvas.drawPath(path3, fillShape);
      canvas.drawPath(path4, fillShape);
    }
    void fillAll() {
      canvas.drawPath(pathBigSquare, fillShape);
    }

    void fillSmallSquare() {
      canvas.drawPath(path1, eraseShape);
      canvas.drawPath(path2, eraseShape);
      canvas.drawPath(path3, eraseShape);
      canvas.drawPath(path4, eraseShape);
      canvas.drawPath(pathBigSquare, eraseShape);
      canvas.drawPath(pathSmSquare, fillShape);
    }

    void fillNone() {
      canvas.drawPath(pathSmSquare, eraseShape);
      canvas.drawPath(pathBigSquare, eraseShape);
      canvas.drawPath(path2, eraseShape);
      canvas.drawPath(path3, eraseShape);
      canvas.drawPath(path4, eraseShape);
    }
    //The switch statement must be told to exit, or it will  execute every case.
    // Cases should always end in a break or return statement

    switch (BUTTONSTATE) {
      case 0: // All shapes clear
        fillNone();
        break;
      case 1: //Triangle filled only
        fillTriangle();
        break;
      case 2: //All triangles filled only
        fillNone();
        fillTriangles();
        break;
      case 4: //Big square - all shapes filled
        fillAll();
        break;
      case 8: //Small square filled only
        fillSmallSquare();
        break;
      default:
        fillNone();
    }


    canvas.drawPath(lineSmSquare, paintLine);
    canvas.drawPath(path1, paintTriangle);
    canvas.drawPath(pathBigSquare, paintLine);
    canvas.drawPath(pathSmSquare, paintLine);
    canvas.drawPath(adjacent, paintAdjacent);
    canvas.drawPath(opposite, paintOpposite);

    paintText(Offset(7.1 * sUnits, 6.9 * sUnits), canvas, size, 15, Colors.red,
        'Opp');
    paintText(
        Offset(5.3 * sUnits, 7.83 * sUnits), canvas, size, 15, Colors.green,
        'Adj');
    paintText(
        Offset(5.0 * sUnits, 6.3 * sUnits), canvas, size, 15, Colors.black,
        'Hyp');

    paintText(
        Offset(1.2 * sUnits, 9.0 * sUnits), canvas, size, 10, Colors.black,
        'Area of triangle = Opp * Adj / 2');
    paintText(
        Offset(1.2 * sUnits, 10.0 * sUnits), canvas, size, 10, Colors.black,
        'Area of 4 congruent triangles = 2 * Opp * Adj');

    paintText(
        Offset(1.2 * sUnits, 11.0 * sUnits), canvas, size, 10, Colors.black,
        'Area of  Big square = ( Opp + Adj ) ^2');
    paintText(
        Offset(1.1 * sUnits, 12.0 * sUnits), canvas, size, 10, Colors.black,
        ' = Opp ^ 2 + 2 * Opp * Adj + Adj ^ 2');

    paintText(
        Offset(1.1 * sUnits, 12.6 * sUnits), canvas, size, 10, Colors.black,
        'Area small square  ');
    paintText(
        Offset(1.1 * sUnits, 13.0 * sUnits), canvas, size, 10, Colors.black,
        '= Area of big square - area of the 4 triangles');
    paintText(
        Offset(1.1 * sUnits, 13.4 * sUnits), canvas, size, 10, Colors.black,
        '= Opp ^ 2 + 2 * Opp * Adj + Adj ^ 2 - 2 * Opp * Adj ');
    paintText(
        Offset(1.0 * sUnits, 13.8 * sUnits), canvas, size, 10, Colors.black,
        ' = Opp ^ 2 + Adj ^ 2 = Hyp^2');
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}





void paintText( Offset wordOffset, Canvas canvas, Size size, double fontsize, Color fontColor, String words) {

  TextSpan span = new TextSpan(style: new TextStyle(color: Colors.black), text: words);
 // TextSpan span = new TextSpan(style: textStyle, text: words);
//  final textSpan = TextSpan(
 //   text: words,
 //   style: textStyle,
 // );
  final textPainter = TextPainter(
    text:span,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(
    minWidth: 0,
    maxWidth: size.width,
  );

  final offset = wordOffset;
  textPainter.paint(canvas, offset);
}


