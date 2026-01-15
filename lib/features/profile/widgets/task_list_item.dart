import 'package:flutter/material.dart';
import 'package:tascom/features/profile/data/task_model.dart';

class TaskListItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onTap;

  const TaskListItem({
    super.key,
    required this.task,
    this.onTap,
  });

  Color _getStatusColor() {
    switch (task.status.toLowerCase()) {
      case 'active':
        return const Color(0xFF0FA632); 
      case 'in progress':
        return const Color(0xFFD97706); 
      case 'completed':
        return const Color(0xFF2F5FE3); 
      case 'canceled':
        return const Color(0xFFC24141); 
      default:
        return Colors.grey;
    }
  }

  Color _getStatusBackgroundColor() {
    return _getStatusColor().withOpacity(0.1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0XFFF9FAFB), // Changed to white for better contrast
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color:Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                //العنوان
                task.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF251455),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: _getStatusBackgroundColor(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  //الحالة
                  task.status,
                  style: TextStyle(
                    color: _getStatusColor(),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          //الوقت منذ نشر المهمة
          Text(
            "Posted ${task.timeAgo}",
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFB0B0B0),
              fontWeight: FontWeight.w700,
              
            ),
          ),
          const SizedBox(height: 12),

          // Conditional Content based on State
          //هنا لو فى متقدمين أعرض اسمه وصوته اذا لا تجاهل
          if (task.applicantsCount != null)
          
             Row(
               children: [
                 const Icon(Icons.person, size: 16,color: Color(0XFF28A745), ),
                 const SizedBox(width: 4),
                 //عدد المتقدمين للمهمة
                 Text(
                   "${task.applicantsCount} applicants",
                   style: const TextStyle(
                     fontSize: 13,
                     color: Color(0xFF28A745),
                     fontWeight: FontWeight.w500,
                   ),
                 ),
               ],
             ),

          if (task.helperName != null)
          //عرض اسم الشخص المتقدم للمهمة
             Padding(
               padding: const EdgeInsets.only(bottom: 8.0),
               child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: Offset(0, 4)

                    )
                  ]
                ),
                 child: Row(
                  mainAxisSize: MainAxisSize.min,
                   children: [
                     CircleAvatar(
                       radius: 10,
                       backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=12"), // Placeholder
                     ),
                     const SizedBox(width: 8),
                     //هنا عرض اسم الشخص المتقدم للخدمة
                     Text(
                       "Helper: ${task.helperName}",
                       style: const TextStyle(
                         fontSize: 13,
                         color: Color(0xFF251455),
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                   ],
                 ),
               ),
             ),

          const SizedBox(height: 12),
          
          Row(
            children: [
             _buildTag(Icons.home_repair_service, task.category),
             const SizedBox(width: 12),
             _buildTag(Icons.location_on, task.location),
            ],
          ),
           //هنا حالة انا اكتيف
           //صاحب المهمة وهو اكتيف بس يقدر يشوف زر الحذف
          if (task.status.toLowerCase() == 'active' && task.isPostedByMe) ...[
            const SizedBox(height: 16),
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: SizedBox(
                height: 32,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.restore_from_trash_outlined, size: 20, color: Color(0XFFDA392C)),
                  label: const Text(
                    "Remove task",
                    style: TextStyle(
                      color: Color(0xFFDA392C),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0XFFDA392C), width: 1.5), // Stronger red
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
          ],
          //يعنى المهمة شغالة وأنا يلى نشرتها وعندى قرارات
         if (task.status.toLowerCase() == 'in progress' && task.isPostedByMe) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color(0xFF6C38F7),
                       shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: const Text("Mark as done", style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.w600),)
                  )
                ),
                const SizedBox(width: 12),
                 Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.close, size: 16, color: Color(0xFFF44336)),
                    label: const Text(
                      "Cancel task",
                      style: TextStyle(color: Color(0xFFDA392C), fontSize: 12,fontWeight: FontWeight.w600),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFDA392C)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
      //هنا حالة المهمة خلصت ما فى أزرار فقط معلومات
          if (task.status.toLowerCase() == 'canceled') ...[
             const SizedBox(height: 12),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                     Row(
                      children: const [
                        Icon(Icons.person_outline, size: 16, color: Colors.grey),
                         SizedBox(width: 4),
                        Text("Claimed by Me", style: TextStyle(color: Color(0XFFB0B0B0), fontSize: 12),)
                      ],
                     ),
                      const Text("-300pts", style: TextStyle(color:Color(0XFFB0B0B0) , fontSize: 12),)
                 ],
               )
          ],

       
if (task.status.toLowerCase() == 'completed') ...[
  const SizedBox(height: 12),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: const [
          Icon(Icons.percent_outlined, size: 16, color: Colors.grey),
          SizedBox(width: 4),
          Text(
            "Claimed by Ali Ahmad",
            style: TextStyle(
              color: Color(0xFFB0B0B0),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      const Text(
        "+300 pts",
        style: TextStyle(
          color: Color(0xFFB0B0B0),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  )
]
























       
       
       
        ],
      ),
    );
  }

  Widget _buildTag(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        //color: const Color(0xFFF3F1FA), // Light purple bg
        color: Color(0xFFF4F0FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: const Color(0xFF6B39F4)),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 11,
               
                color: Color(0xFF6B39F4),
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
