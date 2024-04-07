// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:app/pages/Broadcast.dart';
import 'package:flutter/material.dart';
import 'UniversitySelectionPage.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> channels = []; // List to hold channels
  Map<String, DateTime> lastUpdatedTimes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              "Chat room",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20, // Adjust the size as needed
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey, // Setting the background color to grey
              borderRadius: BorderRadius.circular(10), // Adding border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Adding a shadow
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(
                          255,
                          15,
                          15,
                          15,
                        ), // Setting hint text color
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      // Implement your search logic here
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Implement your search functionality here
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display existing channels
                    for (String channel in channels)
                      GestureDetector(
                        onTap: () {
                          // Handle clicking on channel
                          List<String> parts = channel.split(" - ");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BroadcastChannelPage(
                                      selectedUniversity: parts[0],
                                      selectedCourse: parts[1],
                                    )),
                          );
                          print('Clicked on channel: $channel');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(channel),
                              // Display last updated time on the right-most edge
                              Text(
                                lastUpdatedTimes[channel] != null
                                    ? 'Last Updated: ${DateFormat('hh:mm a').format(lastUpdatedTimes[channel]!)}'
                                    : '',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to UniversitySelectionPage and wait for result
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UniversitySelectionPage()),
          );

          // Check if result is not null and add channel
          if (result != null) {
            setState(() {
              String newChannel = result;
              channels.add(newChannel);
              lastUpdatedTimes[newChannel] = DateTime
                  .now(); // Update last updated time for the new channel
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
