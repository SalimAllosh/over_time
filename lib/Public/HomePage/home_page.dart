import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:over_time/Core/Dependincy%20Injection/dependency_injection.dart';
import 'package:over_time/Core/DummyData/institute_list.dart';
import 'package:over_time/Features/OverTime/DomainLayer/UseCases/Session/get_all_sessions.dart';
import 'package:over_time/Public/Widgets/balance_widget.dart';
import 'package:over_time/Public/Widgets/institute_table.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetAllSessionsUsecase getAllSessionsUsecase =
      GetAllSessionsUsecase(sessionRepository: sl());
  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
  final _key = GlobalKey<ExpandableFabState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final shit = getAllSessionsUsecase();

    return SideMenu(
      key: _endSideMenuKey,
      inverse: true, // end side menu
      background: Theme.of(context).colorScheme.onPrimary,
      type: SideMenuType.slideNRotate,
      menu: buildMenu(context),
      onChange: (isOpened) {
        setState(() => isOpened = isOpened);
      },

      child: IgnorePointer(
        ignoring: isOpened,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => toggleMenu(true),
              )
            ],
            title:
                Text("OverTime", style: Theme.of(context).textTheme.titleLarge),
          ),
          body: Column(
            children: [
              BalanceWidget(balance: 15321),
              InstetuteTable(institutes: instituteList),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Generate Report",
                    style: Theme.of(context).textTheme.displayMedium,
                  ))
            ],
          ),
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: ExpandableFab(
            type: ExpandableFabType.side,
            children: [
              FloatingActionButton.small(
                heroTag: "null",
                child: const Icon(Icons.edit),
                onPressed: () {},
              ),
              FloatingActionButton.small(
                heroTag: null,
                child: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenu(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.article_outlined, color: Colors.white),
            title: const Text("Sessions"),
            textColor: Colors.white,
            dense: true,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
            child: ListTile(
              onTap: () {},
              leading: const Icon(Icons.menu_book, color: Colors.white),
              title: const Text("Courses", overflow: TextOverflow.ellipsis),
              textColor: Colors.white,
              dense: true,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06),
            child: ListTile(
              onTap: () {},
              leading:
                  const Icon(Icons.account_box_outlined, color: Colors.white),
              title: const Text("Students", overflow: TextOverflow.ellipsis),
              textColor: Colors.white,
              dense: true,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.09),
            child: ListTile(
              onTap: () {},
              leading: const Icon(Icons.book, color: Colors.white),
              title: const Text("Subjects", overflow: TextOverflow.ellipsis),
              textColor: Colors.white,
              dense: true,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.12),
            child: ListTile(
              onTap: () {},
              leading: const Icon(Icons.account_balance_outlined,
                  color: Colors.white),
              title: const Text("Institutes", overflow: TextOverflow.ellipsis),
              textColor: Colors.white,
              dense: true,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
            child: ListTile(
              onTap: () {},
              leading: const Icon(Icons.money, color: Colors.white),
              title: const Text("Payments", overflow: TextOverflow.ellipsis),
              textColor: Colors.white,
              dense: true,
            ),
          ),
        ],
      ),
    );
  }
}
