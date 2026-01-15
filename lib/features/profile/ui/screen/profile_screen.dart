import 'package:flutter/material.dart';
import 'package:tascom/features/profile/data/task_model.dart';
import 'package:tascom/features/profile/widgets/empty_state_widget.dart';
import 'package:tascom/features/profile/widgets/profile_header.dart';
import 'package:tascom/features/profile/widgets/stats_row.dart';
import 'package:tascom/features/profile/widgets/task_list_item.dart';
import 'package:tascom/features/profile/widgets/task_tabs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isPostedSelected = true;

  // Mock Data
  final List<TaskModel> allTasks = [
    TaskModel(
      id: "1",
      title: "Help move boxes",
      timeAgo: "2 days ago",
      status: "Active",
      applicantsCount: "22",
      category: "Home Services",
      location: "Nablus, Palestine",
      isPostedByMe: true,
    ),
    TaskModel(
      id: "2",
      title: "Help move boxes",
      timeAgo: "2 days ago",
      status: "In Progress",
      helperName: "Ali Rayyan",
      category: "Home Services",
      location: "Palestine, Nablus/3km",
      isPostedByMe: true,
    ),
    TaskModel(
        id: "3",
        title: "Help move boxes",
        timeAgo: "2 days ago",
        status: "Completed",
        helperName: "Ali Rayyan",
        category: "Home Services",
        location: "Nablus, Palestine",
        isPostedByMe: true),
    TaskModel(
      id: "4",
      title: "Help move boxes",
      timeAgo: "Cancelled date: 25/12/2025",
      status: "Canceled",
      helperName: "Ali Rayyan",
      category: "Home Services",
      location: "Palestine, Nablus/3km",
      isPostedByMe: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // For 'Posted' we show specific tasks, for 'Claimed' we show others to match the screenshots
    //اختيار المهام المعروضة
    List<TaskModel> visibleTasks;
    if (isPostedSelected) {
       visibleTasks = allTasks.where((t) => t.status == 'Active' || t.status == 'Completed').toList();
    } else {
       visibleTasks = allTasks.where((t) => t.status == 'In Progress' || t.status == 'Canceled').toList();
    }

    return Scaffold(
      backgroundColor: Colors.white, // White background for the bottom part
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF251455),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF9FAFB), // AppBar matches top section
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Color(0xFF251455),),
            onPressed: () {
               // Settings action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section with Grey Background
            Container(
              color: const Color(0xFFF9FAFB),
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 24),
              // ignore: prefer_const_constructors
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: ProfileHeader(),
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: StatsRow(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TaskTabs(
                isPostedSelected: isPostedSelected,
                onPostedTap: () {
                  setState(() {
                    isPostedSelected = true;
                  });
                },
                onClaimedTap: () {
                  setState(() {
                    isPostedSelected = false;
                  });
                },
              ),
            ),
            
            // Bottom Section (Grey background from Scaffold)
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Your tasks",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF251455),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: Container(
                      height: 32,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0XFFCCCCCC)),
                      ),
                      child: DropdownButton<String>(
                        value: "All",
                        icon: const Icon(Icons.keyboard_arrow_down,color: Color(0XFF251455),),
                        selectedItemBuilder: (context) {
                          return <String>['All', 'Active', 'Completed'].map((String value){
                            return Center(
                              child: Text(
                                value,
                                style: const TextStyle(
                color: Color(0xFF251455),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
                              ),
                            );
                          }).toList();
                        },
                        items: <String>['All', 'Active', 'Completed']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        //هنا شو المستخدم اختار
                        onChanged: (String? newValue) {
                          // Handle filter change
                        },
                        style: const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            //هنا هل قائمة المهام فاضية
            //نعم → EmptyState
            //لا → ListView
            if (visibleTasks.isEmpty)
              EmptyStateWidget(
                onActionPressed: () {
                  // TODO: Navigate to Create Task Screen when available
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Navigate to Create Task Screen")),
                  );
                },
              )
            else
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: visibleTasks.length,
                itemBuilder: (context, index) {
                  return TaskListItem(task: visibleTasks[index]);
                },
              ),
            const SizedBox(height: 40),
            // Bottom Navbar placeholder area if needed, or keeping it clean
             Padding(
               padding: const EdgeInsets.only(bottom: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                     Icon(Icons.home_outlined, color: Colors.grey.shade300, size: 28,),
                     Icon(Icons.search, color: Colors.grey.shade300, size: 28,),
                     Container(
                       height: 50,
                       width: 50,
                       decoration: const BoxDecoration(
                         color: Color(0xFF6C38F7),
                         shape: BoxShape.circle,
                       ),
                       child: const Icon(Icons.add, color: Colors.white),
                     ),
                     Icon(Icons.work_outline, color: Colors.grey.shade300, size: 28,),
                     const Icon(Icons.person, color:  Color(0xFF6C38F7), size: 28,),
                 ],
               ),
             )
          ],
        ),
      ),
    );
  }
}
