import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showYourUploads = true; // Track whether "Your Uploads" button is active

  // Sample list of uploaded files with dummy image assets
  List<Map<String, String>> uploadedFiles = [
    {'name': 'File 1.pdf', 'asset': 'assets/pdf_icon.png'},
    {'name': 'File 2.jpg', 'asset': 'assets/image_icon.png'},
    // Add more files as needed
  ];

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
                suffixIcon: Icon(Icons.filter_list),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
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
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
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
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showYourUploads = false;
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
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
                itemCount: uploadedFiles.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.file_upload),
                      title: Text(uploadedFiles[index]['name']),
                      subtitle: Text('Uploaded: ${DateTime.now()}'),
                      onTap: () {
                        // Navigate to the file preview screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilePreviewScreen(
                              assetPath: uploadedFiles[index]['asset'],
                            ),
                          ),
                        );
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

class FilePreviewScreen extends StatelessWidget {
  final String assetPath;

  FilePreviewScreen({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Preview'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Image.asset(assetPath), // Display image preview
      ),
    );
  }
}
// file upload is causing a issue need to figure out the image problem
