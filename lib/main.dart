//Partners are Griffin Mcue and Devon Ivory
import 'dart:core';

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
String message = 'Poke With Sharp Stick.';
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

 if (hungerLevel >= 33 && hungerLevel < 66) 
{
setState(() 
{
    message = 'Your pet is hungry.';
});
}

else if (hungerLevel >= 66 && hungerLevel < 99) 
{
setState(() 
{
    message = 'Your pet is very hungry.';
});
}

else if (hungerLevel >= 99) 
{
setState(() 
{
    message = 'Your pet is close to death.';
});
}

else if (hungerLevel >= 100 && happinessLevel <= 10) 
{
setState(() 
{
    message = 'Your pet is now dead.';
});
//Navigator.of(context).pop();
}
 

/*
if (hungerLevel >= 66 && happinessLevel <= 66) 
{
setState(() 
{
    message = 'Your pet is on the verge of death.';
});
none = 33;
 */

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
  SizedBox(
                width: 100,
                child: TextField(
                  onChanged: (value) {
                    print('name $value');
                  },
                  onSubmitted: (value) {
                    print('Value submitted: $value');
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter PetName',
                    hintText: 'Type name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
  Image.asset('assets/cat.png',
  color: happinessLevel > 70 ? Colors.green :happinessLevel <30? Colors.red: Colors.white,
  width: 200,
  height: 200,
  fit: BoxFit.cover, ),
  Text(
     happinessLevel> 70?'good': happinessLevel<30?'bad': 'neutral',
  ),
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

child: Text(message),

),
*/

ElevatedButton(
  onPressed: () {
    conditions(hungerLevel, happinessLevel);
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