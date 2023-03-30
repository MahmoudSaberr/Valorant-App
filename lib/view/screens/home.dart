import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_app/view/screens/agents_screen.dart';
import 'package:valorant_app/view/screens/home_screen.dart';

import '../../constant/constant.dart';
import '../../cubit/characters_cubit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    context.read<CharactersCubit>().getCharacter();
    super.initState();
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List _pages = [const HomeScreen(), const AgentsScreen()];
    return Scaffold(
      body: Center(child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 14,
        selectedFontSize: 14,
        selectedItemColor: Constant.scaffoldBackgroundColor,
        unselectedItemColor: Constant.whiteColor,
        backgroundColor: Constant.primaryColor,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 30),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view,
            ),
            label: 'Roles',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_outline,
            ),
            label: 'Agents',
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
