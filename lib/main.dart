import 'package:flutter/material.dart';
void main() {
runApp(MaterialApp(
home: DigitalPetApp(),
));
}

class DigitalPetApp extends StatefulWidget 
{
@override
_DigitalPetAppState createState() => _DigitalPetAppState();
}
class _DigitalPetAppState extends State<DigitalPetApp> {
String petName = "Your Pet";
String message = 'Your Pet Is Alive, for now.';
int happinessLevel = 50;
int hungerLevel = 50;
int none = 0;
// Function to increase happiness and update hunger when playing with the pet
void _playWithPet() 
{
setState(() {
happinessLevel = (happinessLevel + 10).clamp(0, 100);
_updateHunger();
});
}
// Function to decrease hunger and update happiness when feeding the pet

/*
void _pokeWithStick() 
{
setState(() {
none = (none + 1).clamp(0, 100);
_updateNone();
});
}
*/


void _feedPet() {
setState(() {
hungerLevel = (hungerLevel - 10).clamp(0, 100);
_updateHappiness();
});
}
// Update happiness based on hunger level
void _updateHappiness() {
if (hungerLevel < 30) {
happinessLevel = (happinessLevel - 20).clamp(0, 100);
} else {
happinessLevel = (happinessLevel + 10).clamp(0, 100);
}
}
// Increase hunger level slightly when playing with the pet
void _updateHunger() 
{
hungerLevel = (hungerLevel + 5).clamp(0, 100);
if (hungerLevel > 100) 
{
hungerLevel = 100;
happinessLevel = (happinessLevel - 20).clamp(0, 100);
}

}


/*
void _updateNone() 
{
none = (none + 1).clamp(0, 100);
if (none > 100) 
{
none = 100;
}

}

*/

void conditions(int hungerLevel, int happinessLevel) 
{

 if (hungerLevel >= 66 && happinessLevel <= 66) 
{
setState(() 
{
    message = 'Your pet is on the verge of death.';
});
none = 33;
  //Navigator.of(context).pop();
}


}







@override
Widget build(BuildContext context) 
{
return Scaffold
(
appBar: AppBar(
title: Text('Digital Pet'),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
  Image.asset('assets/cat.png',
  color: happinessLevel > 70 ? Colors.green : Colors.white,
  width: 200,
  height: 200,
  fit: BoxFit.cover, ),
Text(
'Name: $petName',
style: TextStyle(fontSize: 20.0),
),
SizedBox(height: 16.0),
Text(
'Happiness Level: $happinessLevel',
style: TextStyle(fontSize: 20.0),
),


SizedBox(height: 16.0),
Text(
'Hunger Level: $hungerLevel',
style: TextStyle(fontSize: 20.0),
),

SizedBox(height: 32.0),
ElevatedButton(
onPressed: _playWithPet,
child: Text('Play with Your Pet'),
),

SizedBox(height: 16.0),

ElevatedButton(
onPressed: _feedPet,
child: Text('Feed Your Pet'),
),


SizedBox(height: 16.0),
Text(
'Death Level: $none',
style: TextStyle(fontSize: 20.0),
),
 
/*
SizedBox(height: 32.0),
ElevatedButton(

  
onPressed: _pokeWithStick,

child: Text('Poke with Stick'),

),
*/

ElevatedButton(
  onPressed: () {
    setState(() {
      none++;
    });
  },
  child: Text(message),
)




],
),
),
);
}
}