import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final TextEditingController _searchController = TextEditingController();
  List<String> allUsers = List.generate(15, (index) => 'User ${index + 1}');
  List<String> allCommunities = List.generate(10, (index) => 'Community ${index + 1}');
  List<String> filteredUsers = [];
  List<String> filteredCommunities = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = allUsers;
    filteredCommunities = allCommunities;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _filterContent(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      results = _selectedIndex == 0 ? allUsers : allCommunities;
    } else {
      results = (_selectedIndex == 0 ? allUsers : allCommunities).where(
        (user) => user.toLowerCase().contains(enteredKeyword.toLowerCase()),
      ).toList();
    }

    setState(() {
      if (_selectedIndex == 0) {
        filteredUsers = results;
      } else {
        filteredCommunities = results;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: _filterContent,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Image.asset("assets/icons/vector.png", width: 24, height: 24),
                      onPressed: () {
                        // Implement edit functionality
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedIndex = index;
                      _filterContent(_searchController.text);
                    });
                  },
                  children: [
                    ListView.builder(
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: const Icon(Icons.person, color: Colors.white),
                              ),
                              title: Text(
                                filteredUsers[index],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('Last message'),
                              trailing: const Text('00:00'),
                              onTap: () {
                                // Implement chat item tap functionality
                              },
                            ),
                            const Divider(
                              height: 0,
                              thickness: 1,
                              indent: 72,
                              endIndent: 16,
                            ),
                          ],
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: filteredCommunities.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: const Icon(Icons.group, color: Colors.white),
                              ),
                              title: Text(
                                filteredCommunities[index],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('Community description'),
                              trailing: const Text('00:00'),
                              onTap: () {
                                // Implement community item tap functionality
                              },
                            ),
                            const Divider(
                              height: 0,
                              thickness: 1,
                              indent: 72,
                              endIndent: 16,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
        decoration: BoxDecoration(
          color: Colors.yellow[700],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/group.png", width: 24, height: 24),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/person.2.png", width: 24, height: 24),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}