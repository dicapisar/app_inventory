import 'package:app_inventory/screens/screens.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

const Map<String, IconData> _KPages = <String, IconData>{
  'Buscar': Icons.search,
  'Inicio': Icons.home,
  'Usuario': Icons.account_circle_outlined,
};

final Set<Widget> _HomeOptions = <Widget>{
  const SearchScreen(),
  const MenuScreen(),
  const UserScreen(),
};

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TabStyle _tabStyle = TabStyle.reactCircle;

  int _index = 1;

  void changeScreen(int index) {
    _index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 1,
      child: Scaffold(
        body: Column(
          children: [_HomeOptions.elementAt(_index)],
        ),
        bottomNavigationBar: ConvexAppBar.badge(
          const <int, dynamic>{2: ''},
          style: _tabStyle,
          items: <TabItem>[
            for (final entry in _KPages.entries)
              TabItem(icon: entry.value, title: entry.key),
          ],
          backgroundColor: AppTheme.primary,
          onTap: (int i) => changeScreen(i),
        ),
      ),
    );
  }
}
