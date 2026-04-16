import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Daily Decision',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double budget = 10;
  double energy = 5;
  String mood = "Happy";
  String timeOfDay = "Afternoon";

  String result = "Your recommendation will appear here";
  String foodSuggestion = "";
  String activitySuggestion = "";
  String placeSuggestion = "";

  void generateSuggestion() {
    setState(() {
      if (budget < 5 && energy < 4) {
        foodSuggestion = "🍜 Make instant noodles or order cheap delivery";
        activitySuggestion = "📺 Watch a movie or series";
        placeSuggestion = "🏠 Stay at home";
      } else if (budget > 20 && energy > 7) {
        foodSuggestion = "🍽️ Nice restaurant dinner";
        activitySuggestion = "🏃 Outdoor activity (hiking, sports, walking)";
        placeSuggestion = "🌆 Downtown or mall";
      } else if (mood == "Sad") {
        foodSuggestion = "🍫 Comfort food (chocolate, ice cream)";
        activitySuggestion = "🎵 Listen to music or meditate";
        placeSuggestion = "🛋️ Cozy corner at home or quiet café";
      } else if (timeOfDay == "Morning") {
        foodSuggestion = "🥐 Breakfast (croissant, eggs, coffee)";
        activitySuggestion = "☀️ Morning walk or exercise";
        placeSuggestion = "🏞️ Park or balcony";
      } else if (timeOfDay == "Evening" || timeOfDay == "Night") {
        foodSuggestion = "🌙 Light dinner or snack";
        activitySuggestion = "📖 Read a book or relax";
        placeSuggestion = "🛏️ Bedroom or living room";
      } else {
        foodSuggestion = "☕ Grab coffee and a sandwich";
        activitySuggestion = "🚶 Take a short walk";
        placeSuggestion = "☕ Local café";
      }

      result =
          "🍽️ Eat: $foodSuggestion\n\n🎯 Do: $activitySuggestion\n\n📍 Go: $placeSuggestion";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Daily Decision - SDD"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue.shade50, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "What Should I Do?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Based on your budget, energy, mood, and time",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 25),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.attach_money, color: Colors.green),
                            const SizedBox(width: 8),
                            const Text(
                              "Budget",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Low (\$0)",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "\$${budget.toInt()}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const Text(
                              "High (\$50)",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Slider(
                          value: budget,
                          min: 0,
                          max: 50,
                          divisions: 10,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              budget = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.flash_on, color: Colors.orange),
                            const SizedBox(width: 8),
                            const Text(
                              "Energy Level",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Low", style: TextStyle(fontSize: 12)),
                            Text(
                              "${energy.toInt()}/10",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            const Text("High", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Slider(
                          value: energy,
                          min: 0,
                          max: 10,
                          divisions: 10,
                          activeColor: Colors.orange,
                          onChanged: (value) {
                            setState(() {
                              energy = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.face, color: Colors.purple),
                            const SizedBox(width: 8),
                            const Text(
                              "Mood",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildMoodButton(
                              "Happy",
                              "😊",
                              Colors.yellow.shade700,
                            ),
                            _buildMoodButton("Sad", "😔", Colors.blue.shade300),
                            _buildMoodButton("Bored", "😐", Colors.grey),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.access_time, color: Colors.blue),
                            const SizedBox(width: 8),
                            const Text(
                              "Time of Day",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: timeOfDay,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                          ),
                          items:
                              const ["Morning", "Afternoon", "Evening", "Night"]
                                  .map(
                                    (time) => DropdownMenuItem(
                                      value: time,
                                      child: Text(
                                        time,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            setState(() {
                              timeOfDay = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                ElevatedButton(
                  onPressed: generateSuggestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text("SUGGEST"),
                ),

                const SizedBox(height: 25),

                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.blue.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "📋 YOUR RECOMMENDATION",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700,
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.blue.shade200),
                        const SizedBox(height: 10),
                        Text(
                          result,
                          style: const TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Based on your inputs, we suggest what to eat, do, and where to go",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoodButton(String moodText, String emoji, Color color) {
    bool isSelected = mood == moodText;
    return GestureDetector(
      onTap: () {
        setState(() {
          mood = moodText;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade400,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 4),
            Text(
              moodText,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
