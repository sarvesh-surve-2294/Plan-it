import 'package:flutter/material.dart';

class NewProjectPage extends StatefulWidget {
  @override
  _NewProjectPageState createState() => _NewProjectPageState();
}

class _NewProjectPageState extends State<NewProjectPage> {
  final TextEditingController carpetAreaController = TextEditingController();
  final TextEditingController builtUpAreaController = TextEditingController();

  // Wall Dimensions Controllers
  final TextEditingController innerWallController = TextEditingController();
  final TextEditingController outerWallController = TextEditingController();

  final TextEditingController numRoomsController = TextEditingController();
  List<TextEditingController> roomTypeControllers = [];
  List<TextEditingController> roomLengthControllers = [];
  List<TextEditingController> roomWidthControllers = [];
  List<TextEditingController> numWindowsControllers = [];
  List<TextEditingController> numDoorsControllers = [];
  List<List<TextEditingController>> windowSizeControllers = [];
  List<List<TextEditingController>> doorSizeControllers = [];

  int numRooms = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A148C),
        title: const Text(
          "Plan-it",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Area',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: carpetAreaController,
                decoration: const InputDecoration(
                  labelText: 'Carpet Area (sq ft)',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: builtUpAreaController,
                decoration: const InputDecoration(
                  labelText: 'Built-Up Area (sq ft)',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              const Text(
                'Wall',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: innerWallController,
                decoration: const InputDecoration(
                  labelText: 'Inner Wall Dimensions (mm)',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: outerWallController,
                decoration: const InputDecoration(
                  labelText: 'Outer Wall Dimensions (mm)',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              const Text(
                'Rooms',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: numRoomsController,
                decoration: const InputDecoration(
                  labelText: 'Number of Rooms',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    numRooms = int.tryParse(value) ?? 0;
                    // Adjust the number of controllers based on the input
                    roomTypeControllers =
                        List.generate(numRooms, (_) => TextEditingController());
                    roomLengthControllers =
                        List.generate(numRooms, (_) => TextEditingController());
                    roomWidthControllers =
                        List.generate(numRooms, (_) => TextEditingController());
                    numWindowsControllers =
                        List.generate(numRooms, (_) => TextEditingController());
                    numDoorsControllers =
                        List.generate(numRooms, (_) => TextEditingController());
                    windowSizeControllers = List.generate(numRooms, (_) => []);
                    doorSizeControllers = List.generate(numRooms, (_) => []);
                  });
                },
              ),
              const SizedBox(height: 10),

              // Dynamic Room Inputs
              ...List.generate(numRooms, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Text(
                      'Room ${index + 1}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: roomTypeControllers[index],
                      decoration: const InputDecoration(
                        labelText: 'Room Type (e.g. Bedroom, Kitchen)',
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: roomLengthControllers[index],
                            decoration: const InputDecoration(
                              labelText: 'Room Length (ft)',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: roomWidthControllers[index],
                            decoration: const InputDecoration(
                              labelText: 'Room Width (ft)',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: numWindowsControllers[index],
                      decoration: const InputDecoration(
                        labelText: 'Number of Windows',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          int numWindows = int.tryParse(value) ?? 0;
                          windowSizeControllers[index] = List.generate(
                              numWindows, (_) => TextEditingController());
                        });
                      },
                    ),
                    ...List.generate(windowSizeControllers[index].length,
                        (windowIndex) {
                      return TextField(
                        controller: windowSizeControllers[index][windowIndex],
                        decoration: InputDecoration(
                          labelText: 'Window ${windowIndex + 1} Size (mm)',
                        ),
                        keyboardType: TextInputType.number,
                      );
                    }),
                    TextField(
                      controller: numDoorsControllers[index],
                      decoration: const InputDecoration(
                        labelText: 'Number of Doors',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          int numDoors = int.tryParse(value) ?? 0;
                          doorSizeControllers[index] = List.generate(
                              numDoors, (_) => TextEditingController());
                        });
                      },
                    ),
                    ...List.generate(doorSizeControllers[index].length,
                        (doorIndex) {
                      return TextField(
                        controller: doorSizeControllers[index][doorIndex],
                        decoration: InputDecoration(
                          labelText: 'Door ${doorIndex + 1} Size (mm)',
                        ),
                        keyboardType: TextInputType.number,
                      );
                    }),
                  ],
                );
              }),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the form submission logic
                  print("Carpet Area: ${carpetAreaController.text}");
                  print("Built-Up Area: ${builtUpAreaController.text}");
                  print("Inner Wall Dimensions: ${innerWallController.text}");
                  print("Outer Wall Dimensions: ${outerWallController.text}");

                  // Print room details
                  for (int i = 0; i < numRooms; i++) {
                    print("Room ${i + 1} Type: ${roomTypeControllers[i].text}");
                    print("Room ${i + 1} Length: ${roomLengthControllers[i].text}");
                    print("Room ${i + 1} Width: ${roomWidthControllers[i].text}");
                    print("Room ${i + 1} Windows: ${numWindowsControllers[i].text}");
                    for (int j = 0; j < windowSizeControllers[i].length; j++) {
                      print(
                          "Window ${j + 1} Size: ${windowSizeControllers[i][j].text}");
                    }
                    print("Room ${i + 1} Doors: ${numDoorsControllers[i].text}");
                    for (int k = 0; k < doorSizeControllers[i].length; k++) {
                      print(
                          "Door ${k + 1} Size: ${doorSizeControllers[i][k].text}");
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4A148C),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Generate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    carpetAreaController.dispose();
    builtUpAreaController.dispose();
    innerWallController.dispose();
    outerWallController.dispose();
    numRoomsController.dispose();
    roomTypeControllers.forEach((controller) => controller.dispose());
    roomLengthControllers.forEach((controller) => controller.dispose());
    roomWidthControllers.forEach((controller) => controller.dispose());
    numWindowsControllers.forEach((controller) => controller.dispose());
    numDoorsControllers.forEach((controller) => controller.dispose());
    windowSizeControllers
        .forEach((list) => list.forEach((controller) => controller.dispose()));
    doorSizeControllers
        .forEach((list) => list.forEach((controller) => controller.dispose()));
    super.dispose();
  }
}
