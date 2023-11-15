import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const ColorMixerGame());
}

class ColorMixerGame extends StatelessWidget {
  const ColorMixerGame({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Mixer Game',
      
       home: Scaffold(
        appBar: AppBar(
          title: Text('Color Mixer Game'),
        ),
        body: Center(child: ColorMixer()),
      ),
    );
  }
}

class ColorMixer extends StatefulWidget {
  @override
  _ColorMixerState createState() => _ColorMixerState();
}

class _ColorMixerState extends State<ColorMixer> {
  Color _selectedColor1 = Colors.red;
  Color _selectedColor2 = Colors.blue;
  Color _mixedColor = Colors.purple; 

   Color mixColors(Color color1, Color color2) {
    return Color.fromRGBO(
      (color1.red + color2.red) ~/ 2,
      (color1.green + color2.green) ~/ 2,
      (color1.blue + color2.blue) ~/ 2,
      1.0,
    );
  }
   @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Color Choice 1
        DropdownButton<Color>(
          value: _selectedColor1,
          items: <DropdownMenuItem<Color>>[
            DropdownMenuItem<Color>(
              value: Colors.red,
              child: Text('Red'),
            ),
            DropdownMenuItem<Color>(
              value: Colors.green,
              child: Text('Green'),
            ),
            DropdownMenuItem<Color>(
              value: Colors.blue,
              child: Text('Blue'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              _selectedColor1 = value!;
              _mixedColor = mixColors(_selectedColor1, _selectedColor2);
            });
          },
        ),

        // Color Choice 2
        DropdownButton<Color>(
          value: _selectedColor2,
          items: <DropdownMenuItem<Color>>[
            DropdownMenuItem<Color>(
              value: Colors.red,
              child: Text('Red'),
            ),
            DropdownMenuItem<Color>(
              value: Colors.green,
              child: Text('Green'),
            ),
            DropdownMenuItem<Color>(
              value: Colors.blue,
              child: Text('Blue'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              _selectedColor2 = value!;
              _mixedColor = mixColors(_selectedColor1, _selectedColor2);
            });
          },
        ),

        // Preview Area
        Container(
          margin: EdgeInsets.all(20.0),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: _mixedColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
    );
  }

}

