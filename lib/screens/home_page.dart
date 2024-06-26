import 'package:flutter/material.dart';
import 'package:groom_admin/screens/auth/login_screen.dart';
import 'package:groom_admin/screens/nav_screens/admin_account_screen.dart';
import 'package:groom_admin/screens/nav_screens/block_screen.dart';
import 'package:groom_admin/screens/nav_screens/complaint_screen.dart';
import 'package:groom_admin/screens/nav_screens/customer_screen.dart';
import 'package:groom_admin/screens/nav_screens/payment_screen.dart';
import 'package:groom_admin/screens/nav_screens/provider_screen.dart';
import 'package:groom_admin/screens/nav_screens/service_screen.dart';
import 'package:groom_admin/utils/colors.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      key: _key,
      drawer: ExampleSidebarX(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: Center(
              child: _ScreensExample(
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: 230,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/logo.png",
              height: 200,
            ),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.person,
          label: 'Customers',
        ),
        SidebarXItem(
          icon: Icons.circle,
          label: 'Providers',
        ),
        SidebarXItem(
          icon: Icons.work,
          label: 'Services',
        ),
        SidebarXItem(
          icon: Icons.comment,
          label: 'Complaint',
        ),
        SidebarXItem(
          icon: Icons.block,
          label: 'Block Users',
        ),
        SidebarXItem(
          icon: Icons.payment,
          label: 'Payments',
        ),
        SidebarXItem(
          icon: Icons.admin_panel_settings,
          label: 'Admin Account',
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Log Out',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return const CustomerScreen();
          case 1:
            return const ProviderScreen();
          case 2:
            return const ServiceScreen();
          case 3:
            return const ComplaintScreen();
          case 4:
            return const BlockScreen();
          case 5:
            return const PaymentScreen();
          case 6:
            return const AdminAccountScreen();
          case 7:
            return AlertDialog(
              title: const Text('Logout Alert'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Do you want to logout?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () async {
                    // await FirebaseAuth.instance.signOut().then((value) => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (builder) => SignInPage()));
                    //     });
                  },
                ),
                TextButton(
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );

          default:
            return Text(
              'Not found page',
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

var primaryColor = mainBtnColor;
var canvasColor = mainBtnColor;
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
