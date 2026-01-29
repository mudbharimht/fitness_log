import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  DateTime currentDate = DateTime.now();
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;
  bool _isLower = false;
  bool _isUpper = false;
  bool _isFreeForm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text('Workout App'),
          Text(
            "${DateTime.now().day}||${DateTime.now().month}",
            style: TextStyle(fontSize: 12),
            )
        ],),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.format_list_numbered),
            tooltip: 'Show Workout Logs',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.fitness_center),
            tooltip: 'Show Workout Page',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Next page')),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(

        child: 
            Container(
              color: Color.fromARGB(200, 200, 200, 150),
              width: MediaQuery.sizeOf(context).width,
              child: Row(
          spacing: 10,
          children: <Widget>[
            NavigationRail(
              backgroundColor: Color.fromARGB(200, 200, 200, 150),
              selectedIndex: _selectedIndex,
              groupAlignment: groupAlignment,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                  if (index == 0) {
                    _isUpper = true;
                    _isLower = false;
                    _isFreeForm = false;
                  }else if (index == 1){_isLower = true;_isUpper = false;_isFreeForm =false;}
                  if (index==2){_isFreeForm = true;_isLower = false;_isUpper =false;
                  }
              });
              },
              labelType: labelType,
              leading: showLeading
                  ? FloatingActionButton(
                      elevation: 0,
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    )
                  : const SizedBox(),
              trailing: showTrailing
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded),
                    )
                  : const SizedBox(),
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Badge(isLabelVisible: _isUpper, child: Icon(Icons.keyboard_arrow_up)),
                  selectedIcon: Icon(Icons.keyboard_arrow_up),
                  label: Text("Upper"),

                ),
    
                NavigationRailDestination(
                  icon: Badge(isLabelVisible: _isLower, child: Icon(Icons.keyboard_arrow_down)),
                  selectedIcon: Icon(Icons.keyboard_arrow_down),
                  label: Text("Lower"),
                ),
              
                NavigationRailDestination(
                  icon: Badge(label: Text('4'), child: Icon(Icons.favorite_border)),
                  selectedIcon: Badge(label: Text('4'), child: Icon(Icons.star)),
                  label: Text("Freeform"),
                ),
              ],
            ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if(_isUpper)
                      Center(child: Text("Upper", style:TextStyle(fontSize: 25,backgroundColor:  Colors.blueAccent))),
                    if (_isLower) 
                      Center(child: Text("Lower", style:TextStyle(fontSize: 25,backgroundColor:  Colors.red))),
                    if (_isFreeForm)
                      Center(child: Text("FreeForm", style:TextStyle(fontSize: 25,backgroundColor:  Colors.yellowAccent))),
                
                    Center(child: Text("ASDASDASDDSdSDSDSDASDASDA", style:TextStyle(fontSize: 25,backgroundColor:  Colors.pink))),
                    
                
                    
                  ],
                ),
              ),
          ],
        ),
            ),
      ),
    );
  }
}
