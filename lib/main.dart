import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BirthDay(),
    ));

class BirthDay extends StatefulWidget {
  const BirthDay({super.key});

  @override
  State<BirthDay> createState() => _BirthDayState();
}

class _BirthDayState extends State<BirthDay> {
  Artboard? bearArtboard;
  SMIBool? isChecking, isHandsUp;
  SMITrigger? trigSuccess, numLook, trigFail;
  StateMachineController? stateMachineController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF48BA7),
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.8,
          child: RiveAnimation.network(
              'https://public.rive.app/community/runtime-files/4788-9655-mely-birthday.riv',
              artboard: 'Light the candle',
              fit: BoxFit.cover, onInit: (artboard) {
            debugPrint(artboard.toString());
            stateMachineController = StateMachineController.fromArtboard(
                artboard, "State Machine 1");
            if (stateMachineController != null) {
              artboard.addController(stateMachineController!);
              var inputListener = stateMachineController!.inputs as List;
              for (var i in inputListener) {
                debugPrint(i.runtimeType.toString());
                debugPrint("name: ${i.name}");
              }
            }
          }),
        ),
      ),
    );
  }
}
