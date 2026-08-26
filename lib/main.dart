import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
       appBar: AppBar(
        title:const  Text('My app modelo'),
        backgroundColor: Colors.blue,
       ),
       body:  SingleChildScrollView(
        child: Column(
          children:[
            const Text('Hello World'),
            const SizedBox(height: 20),
            const Text('Bye World'),
            Container(
              margin: const EdgeInsets.all(20),
                child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                const  Text('Row Item 1'),
                ElevatedButton(
                    onPressed: () => {},
                    child: const  Text('Button'),
                  ),
                  const Text('Row Item 2')
                ]
              )
            ),
            const SizedBox(height: 20),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
               const  Text('Row Item 1'),
               ElevatedButton(
                  onPressed: () => {},
                  child: const  Text('Button'),
                ),
                const Text('Row Item 2')
              ]
            ),
            const SizedBox(height: 20),
           const  TextField(
            style:TextStyle(
              color:Colors.red,
              fontSize: 20,
            ),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
            ),
            const SizedBox(height: 20),
           const Text(
              style:TextStyle(
                color:Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.yellow
              ) ,
              "Ejemplo"
            ),
            TextButton(
              onPressed: () => {},
              child: const Text('Text Button'),
            ),
            TextButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
            OutlinedButton(
              onPressed: () => {},
              child: const Text('Outlined Button'),
            ),
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.thumb_up),
            ),
            const Icon(Icons.fastfood, color: Colors.blue, size: 50),
            
            Image.network(
              width: 200,
              height: 200,
              "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixid=M3w4MjcwNjd8MHwxfHNlYXJjaHwxfHxhbmltYWxzfGVufDB8fHx8MTc4NzYxNTg1Nnww&ixlib=rb-4.1.0&fit=max&q=80")
          ]
        )
       ),
       drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 2'),
            ),
          ],
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ]
      )
    ));
  }
} 