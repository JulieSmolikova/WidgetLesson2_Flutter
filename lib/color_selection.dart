import 'package:flutter/material.dart';

class ColorSelection extends StatefulWidget {
  const ColorSelection({Key? key}) : super(key: key);

  @override
  State<ColorSelection> createState() => _ColorSelectionState();
}

List myColors = <Color>[
  Colors.yellowAccent,
  Colors.black,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.deepOrange,
  Colors.indigo
];
Color primaryColor = myColors[0];

class _ColorSelectionState extends State<ColorSelection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Guitars')),
        ),
        body: Center(
          child: Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: buildImage()),
              Positioned(
                top: 20,
                left: 10,
                child: SizedBox(
                    child: buildColorIcons()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() => RotatedBox(
    quarterTurns: 3,
    child: SizedBox(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(primaryColor, BlendMode.hue),
          child: Container(
            color: Colors.grey.shade300,
            child: Image.asset('assets/images/guitar.png', fit: BoxFit.fitWidth,),
          ),
        ),
    ),
  );

  Widget buildColorIcons() =>
      Column(
        children: [for (var i = 0; i < 8; i++) buildIconBtn(myColors[i])],
      );

  Widget buildIconBtn(Color mycolor) => SizedBox(
        child: Stack(
          children: [
            Positioned(
              top: 6,
              left: 6,
              child: Icon(
                Icons.circle_outlined, size: 35,
                color: primaryColor == mycolor ? mycolor : Colors.transparent,
              )),
            IconButton(
                onPressed: (){
                  setState(() {
                    primaryColor = mycolor;
                  });
                },
              icon: Icon(
                  Icons.circle,
                  size: 30,
                  color: mycolor.withOpacity(0.65),),
            )
          ],
        ),

      );
}