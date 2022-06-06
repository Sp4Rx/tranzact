import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranzact/blocs/app/app_bloc.dart';
import 'package:tranzact/ui/bottom_bar_screens/home_bottom_bar.dart';
import 'package:tranzact/ui/bottom_bar_screens/profile_bottom_bar.dart';
import 'package:tranzact/ui/commons/atoms/tranzact_logo_small.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late final _user = context.select((AppBloc bloc) => bloc.state.user);
  late final TabController _controller = TabController(length: 4, vsync: this);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  late final List<Widget> _widgetOptions = <Widget>[
    const HomeBottomBar(),
    const Text(
      'Explore',
      style: optionStyle,
    ),
    const Text(
      'Inventory',
      style: optionStyle,
    ),
    ProfileBottomBar(
      image: _user.photo,
      email: _user.email,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 132,
        backgroundColor: Colors.white,
        leading: const TranzactLogoSmall(),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            color: TColors.primary2,
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: TabBar(
        controller: _controller,
        unselectedLabelColor: Colors.grey,
        labelColor: TColors.primary2,
        indicatorColor: TColors.primary2,
        onTap: _onItemTapped,
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
            text: 'Home',
          ),
          Tab(
            icon: Icon(Icons.add_circle_outline),
            text: 'Explore',
          ),
          Tab(
            icon: Icon(Icons.inventory_2),
            text: 'Inventory',
          ),
          Tab(
            icon: Icon(Icons.manage_accounts_rounded),
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
