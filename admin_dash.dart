import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_one/presentation/admin/controller/admin_controller.dart';
import 'package:hostel_one/presentation/admin/create_staff.dart';
import 'package:hostel_one/presentation/admin/reviews_list.dart';
import 'package:hostel_one/presentation/admin/staff/add_new_hostel.dart';
import 'package:hostel_one/presentation/admin/staff/admin_approved.dart';
import 'package:hostel_one/presentation/admin/staff/all_hostels.dart';
import 'package:hostel_one/presentation/admin/staff/edit_hostels.dart';
import 'package:hostel_one/presentation/admin/staff/staff_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostel_one/presentation/auth_screens/controller/auth_controller.dart';
import 'package:hostel_one/presentation/auth_screens/login.dart';

import 'staff/hostel_bookings.dart';

class StaffAdminScreen extends StatefulWidget {
  StaffAdminScreen({required AuthController authController, Key? key});

  @override
  State<StaffAdminScreen> createState() => _StaffAdminScreenState();
}

class _StaffAdminScreenState extends State<StaffAdminScreen> {
  AdminController admin = Get.put(AdminController());
  AuthController _authController = Get.find();

  void _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the login screen
      Get.offAll(
          const LoginScreen()); // Assuming you are using Get for navigation
      // Show success message
      Get.snackbar(
        'Success',
        'You have been successfully logged out',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      // Show error message if sign out fails
      Get.snackbar(
        'Error',
        'Failed to sign out. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            // _signOut;
            await FirebaseAuth.instance.signOut();
            // Navigate to the login screen
            Get.offAll(
                const LoginScreen()); // Assuming you are using Get for navigation
            // Show success message
            Get.snackbar(
              'Success',
              'You have been successfully logged out',
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          },
        ),
        centerTitle: true,
        elevation: 0, // Remove app bar elevation
        backgroundColor: const Color.fromARGB(255, 120, 138, 120),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 32),
            Center(
              // Wrap with Center widget to center horizontally
              child: buildServiceSection(
                title: 'Hostel Management',
                buttons: [
                  buildServiceCard(
                    context,
                    'Create Hostels',
                    Icons.home,
                    () => Get.to(() => EditHostels()),
                  ),
                  buildServiceCard(
                    context,
                    'Manage Hostel Details',
                    Icons.business,
                    () => Get.to(() => HostelListView()),
                  ),
                ],
              ),
            ),
            Center(
              // Wrap with Center widget to center horizontally
              child: buildServiceSection(
                title: 'User Management',
                buttons: [
                  buildServiceCard(
                    context,
                    'Create New Admin',
                    Icons.person_add,
                    () => Get.to(CreateStaffScreen(
                      authController: _authController,
                    )),
                  ),
                  buildServiceCard(
                    context,
                    'View Admins and Roles',
                    Icons.people,
                    () => Get.to(const StaffList()),
                  ),
                  buildServiceCard(
                    context,
                    'Manage Students',
                    Icons.school,
                    () => Get.to(AdminBookedDataScreen()),
                  ),
                ],
              ),
            ),
            Center(
              // Wrap with Center widget to center horizontally
              child: buildServiceSection(
                title: 'Application Management',
                buttons: [
                  buildServiceCard(
                    context,
                    'View Student Applications',
                    Icons.assignment,
                    () => Get.to(() => ManageBookingScreen()),
                  ),
                  buildServiceCard(
                    context,
                    'Reviews',
                    Icons.done_all,
                    () {
                      // Navigate to Approval Page
                      Get.to(AdminReviewScreen());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildServiceSection(
      {required String title, required List<Widget> buttons}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20.0,
          runSpacing: 20.0,
          children: buttons,
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget buildServiceCard(BuildContext context, String label, IconData icon,
      VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.grey, Colors.blueAccent],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
