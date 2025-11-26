import 'package:flutter/material.dart';

/*Info: Appbar da lista de tarefa*/

class ListaTarefaAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    /*AppBar*/
    return AppBar(
      /*Cor de Fundo*/
      backgroundColor: const Color(0xFFFFD900),
      elevation: 0,
      /*Menu Hambúrguer*/
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu_rounded, size: 40),
      ),

      /*TabBar*/
      bottom: const TabBar(
        indicatorColor: Color(0xFF000000),
        labelColor: Color(0xFF000000),
        unselectedLabelColor: Color(0x80000000),
        indicatorWeight: 3,
        labelStyle: TextStyle(fontSize: 18),
        unselectedLabelStyle: TextStyle(fontSize: 17),
        tabs: [
          Tab(text: "Todas"),
          Tab(text: "Pedentes"),
          Tab(text: "Feitas"),
        ],
      ),
    );
  }
}
