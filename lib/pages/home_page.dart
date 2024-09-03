import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}
PageController pageController = PageController();
int itemPosition = 0;

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Allocation Manager"),
        centerTitle: true,

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Image.asset('assets/logo_sem_texto-removebg-preview.png'),

      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            itemPosition = index;
          });
          pageController.animateToPage(index, duration: Duration(microseconds: 300) , curve: Curves.easeIn);
        },
        currentIndex: itemPosition,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Colaboradores'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Gant')
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          Container(color: Colors.red,),
          Container(color: Colors.green,),
          Container(color: Colors.yellow,),
        ],
      ),
      // body: const Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[],
      //   ),
      // ),
    );
  }
}
