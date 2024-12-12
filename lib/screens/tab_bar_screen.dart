import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  // Lists for enabled and disabled features with descriptions
  List<Map<String, String>> _enabledFeatures = [
    {'title': 'FEATURE1', 'description': 'This is feature 1'},
    {'title': 'FEATURE2', 'description': 'This is feature 2'},
    {'title': 'FEATURE3', 'description': 'This is feature 3'},
    {'title': 'FEATURE4', 'description': 'This is feature 4'},
    {'title': 'FEATURE5', 'description': 'This is feature 5'},
    {'title': 'FEATURE6', 'description': 'This is feature 6'},
  ];

  List<Map<String, String>> _disabledFeatures = [
    {'title': 'FEATURE7', 'description': 'This is feature 7'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Bar'),
      ),
      body: LayoutBuilder( //Dynamically adjusts child widgets based on available screen space
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded( //Creates a widget that expands a child 
                child: SingleChildScrollView( // single widget can be scrolled
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Enabled Features',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          elevation: 2,
                          child: ConstrainedBox( //widget that imposes additional constraints on its child
                            constraints: BoxConstraints(
                              maxHeight: constraints.maxHeight * 0.7,
                            ),
                            child: ReorderableListView.builder(
                              shrinkWrap: true, //Makes the list only occupy the necessary height instead of infinite space
                              physics: const BouncingScrollPhysics(), //Enables a bounce effect when the user scrolls past the boundaries 
                              itemCount: _enabledFeatures.length,
                              onReorder: (oldIndex, newIndex) {
                                setState(() {
                                  if (oldIndex < newIndex) {
                                    newIndex -= 1;
                                  }
                                  final Map<String, String> movedFeature =
                                      _enabledFeatures.removeAt(oldIndex); //Removes the item at oldIndex from the _enabledFeatures list.
                                  _enabledFeatures.insert(  //Inserts the previously removed item (movedFeature) at the newIndex.
                                      newIndex, movedFeature);
                                });
                              },
                              itemBuilder: (context, index) {
                                return ListTile(
                                  key: Key('enabled-$index'),
                                  title: Text(_enabledFeatures[index]['title']!),
                                  subtitle: Text(_enabledFeatures[index]
                                          ['description']!),
                                  leading: index == 0  //If the item is the first in the list ,  disable checkbox
                                      ? const Icon(Icons.check_box,
                                          color: Colors.grey)
                                      : IconButton(
                                          icon: const Icon(
                                            Icons.remove_circle,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _disabledFeatures.add(
                                                  _enabledFeatures
                                                      .removeAt(index));
                                            });
                                          },
                                        ),
                                  trailing: const Icon(Icons.drag_handle),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Disabled Features',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: _disabledFeatures.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  key: Key('disabled-$index'),
                                  title: Text(_disabledFeatures[index]
                                      ['title']!),
                                  subtitle: Text(_disabledFeatures[index]
                                          ['description']!),
                                  leading: IconButton(
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: Colors.green,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _enabledFeatures.add(
                                            _disabledFeatures.removeAt(index));
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
