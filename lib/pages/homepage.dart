import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showYourUploads = true; // Track whether "Your Uploads" button is active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gomedic'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search records',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list), // Add filter icon
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
                height: 10), // Add some spacing between search bar and buttons
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showYourUploads = true;
                      });
                    },
                    child: Container(
                      height: 40, // Adjust height to your preference
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            20.0), // Button-specific border radius
                        color: _showYourUploads ? Colors.blue : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Your Uploads',
                          style: TextStyle(
                            color:
                                _showYourUploads ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Add spacing between buttons
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showYourUploads = false;
                      });
                    },
                    child: Container(
                      height: 40, // Adjust height to your preference
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            20.0), // Button-specific border radius
                        color: !_showYourUploads ? Colors.blue : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Shared by Doctor',
                          style: TextStyle(
                            color:
                                !_showYourUploads ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 0, // Replace with actual list size
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.file_upload),
                      title: Text('Medical File $index'),
                      subtitle: Text('Uploaded: ${DateTime.now()}'),
                      onTap: () {
                        // Implement file details screen or other actions here
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement file upload action here
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
