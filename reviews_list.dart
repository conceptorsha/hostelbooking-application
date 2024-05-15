import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_one/utils/theme/colors.dart';

import '../../data/hostels.dart';
import '../student_screens/controller/students_controller.dart';

class AdminReviewScreen extends StatefulWidget {
  AdminReviewScreen({super.key});

  @override
  State<AdminReviewScreen> createState() => _AdminReviewScreenState();
}

class _AdminReviewScreenState extends State<AdminReviewScreen> {
  final UsersController usersController = Get.put(UsersController());

  @override
  void onInit() {
    super.initState();
    usersController.fetchReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reviews',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.kAppBarColor,
      ),
      body: Obx(
        () {
          if (usersController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 119, 169, 211),
                    Color(0xFF2196F3),
                  ],
                ),
              ),
              child: ListView.builder(
                itemCount: usersController.reviews.length,
                itemBuilder: (context, index) {
                  final dynamic review = usersController.reviews[index];

                  // Deserialize the hostelData field into a HostelData object
                  final hostelData = HostelData.fromJson(review['hostelData']);

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Color(0xFFE1E8EB),
                        ],
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        review['title'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Comment: ${review['review']}",
                              textAlign: TextAlign.center),
                          SizedBox(height: 4),
                          _buildRatingStars(review['rating'].toString()),

                          Text('Username: ${review['userEmail']}',
                              textAlign: TextAlign.center),

                          // Display hostelData
                          Text('Hostel Name: ${hostelData.name}',
                              textAlign: TextAlign.center),
                          Text('Location: ${hostelData.location}',
                              textAlign: TextAlign.center),
                          Text('Price: ${hostelData.price}',
                              textAlign: TextAlign.center),
                          // You can display other hostelData fields as needed
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildRatingStars(String rating) {
    int starCount = int.tryParse(rating) ?? 0;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => Icon(
            index < starCount ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}




// // class ReviewsListScreen extends StatelessWidget {
//   final UsersController usersController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Reviews',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: AppColors.kAppBarColor,
//       ),
//       body: Obx(
//         () {
//           if (usersController.isLoading.value) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: usersController.reviews.length,
//               itemBuilder: (context, index) {
//                 return _buildReviewCard(
//                   usersController.reviews[index],
//                   usersController.reviews[index].imageUrls,
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildReviewCard(String review, List<String> imageUrls) {
//     return Card(
//       margin: EdgeInsets.all(16),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 // Display small pictures of the hostel
//                 for (var url in imageUrls)
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.network(
//                       url,
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Review: $review',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }