import 'package:flutter/material.dart';
import 'package:tascom/features/settings/widgets/saved_task_card.dart';

class SavedTasksScreen extends StatelessWidget {
  const SavedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data for Saved Tasks matching the design
    final List<Map<String, String>> savedTasks = [
       {
        "title": "Need Someone to Take Care of My Cat",
        "points": "30 Points",
        "description": "I need someone to take care of my cat for a...",
        "image": "assets/images/Rectangle 28.png"
      },
      {
        "title": "Need Help with Fixing My Front Door",
        "points": "20 Points",
        "description": "I need someone to help fix my front door lock...",
        "image": "assets/images/Rectangle 29 (1).png"
      },
      {
        "title": "Large Bus Rental for Group Trip",
        "points": "55 Points",
        "description": "Looking to rent a spacious bus for an upcoming...",
        "image": "assets/images/Rectangle 29 (2).png"
      },
      {
        "title": "Help with Apartment Clean",
        "points": "25 Points",
        "description": "I'm looking for someone to help me clean my...",
        "image": "assets/images/Rectangle 29.png"
      },
    ]; 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Saved Tasks",
          style: TextStyle(
             color: Color(0xFF251455),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF9FAFB),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF251455),size:20 ,),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: savedTasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
                    width: 140,
                    height: 140,
                    padding: EdgeInsets.all(10),
                    
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F2FF), // Light purple background for icon
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('assets/images/Group.png'),
                    //const Icon(Icons.search, size: 50, color: Color(0xFF6C38F7)), // Magnifying glass
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "No saved tasks yet.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF251455),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "You haven't saved any tasks yet.\nSave tasks to easily find and review them later.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(24.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65, // Adjust ratio for card height
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: savedTasks.length,
              itemBuilder: (context, index) {
                final task = savedTasks[index];
                return SavedTaskCard(
                  imagePath: task["image"]!,
                  title: task["title"]!,
                  points: task["points"]!,
                  description: task["description"]!,
                );
              },
            ),
    );
  }
}
