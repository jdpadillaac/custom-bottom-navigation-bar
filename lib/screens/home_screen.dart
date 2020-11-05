import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final TextStyle textStyle = TextStyle(color: Colors.blue, fontSize: 40);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Drawer(),
        backgroundColor: Color(0xFFF5F7FA),
        appBar: AppBar(
          title: Text('Inicio'),
        ),
        body: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: index,
                children: [
                  Center(child: Text('Pagina $index', style: textStyle)),
                  Center(child: Text('Pagina $index', style: textStyle)),
                  Center(child: Text('Pagina $index', style: textStyle)),
                  Center(child: Text('Pagina $index', style: textStyle)),
                ],
              ),
            ),
            CustomBottomNavigationBar(
              homeIndex: index,
              onIndexSelected: (value) {
                setState(() {
                  index = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int homeIndex;
  final ValueChanged<int> onIndexSelected;

  const CustomBottomNavigationBar({
    Key key,
    @required this.homeIndex,
    @required this.onIndexSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double iconSize = 32;
    const Color iconColor = Color(0xFF243656);
    const selectedColor = Color(0xFF0070BA);

    // print(homeIndex);
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(children: [
                    IconButton(
                      icon: Icon(
                        Icons.home_outlined,
                        color: homeIndex == 0 ? selectedColor : iconColor,
                        size: iconSize,
                      ),
                      onPressed: () => onIndexSelected(0),
                    ),
                    homeIndex == 0 ? Text('Inicio') : SizedBox()
                  ]),
                ),
                Container(
                  child: Row(children: [
                    IconButton(
                      icon: Icon(
                        Icons.group_outlined,
                        color: homeIndex == 1 ? selectedColor : iconColor,
                        size: iconSize,
                      ),
                      onPressed: () => onIndexSelected(1),
                    ),
                    homeIndex == 1 ? Text('Amigos') : SizedBox()
                  ]),
                ),
                Container(
                  child: Row(children: [
                    IconButton(
                      icon: Icon(
                        Icons.account_balance_wallet_outlined,
                        color: homeIndex == 2 ? selectedColor : iconColor,
                        size: iconSize,
                      ),
                      onPressed: () => onIndexSelected(2),
                    ),
                    homeIndex == 2 ? Text('Dinero') : SizedBox()
                  ]),
                ),
                Container(
                  child: Row(children: [
                    IconButton(
                      icon: Icon(
                        Icons.settings_outlined,
                        color: homeIndex == 3 ? selectedColor : iconColor,
                        size: iconSize,
                      ),
                      onPressed: () => onIndexSelected(3),
                    ),
                    homeIndex == 3 ? Text('Configuracion') : SizedBox()
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
