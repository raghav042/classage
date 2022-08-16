/*
class Assignments extends StatefulWidget {
  @override
  _AssignmentsState createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  int selectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.pending_actions), label: "Pending"),
      BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "All")
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[PendingAssignment(), AllAssignment()],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.lightBlue,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt, color: Colors.white),
          tooltip: 'Pick Image',
          elevation: 0,
          backgroundColor: Colors.lightBlue[200], onPressed: () {},
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

 */
