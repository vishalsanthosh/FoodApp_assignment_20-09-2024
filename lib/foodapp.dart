import 'package:flutter/material.dart';
import 'package:foodapp/database.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delivery",style: TextStyle(fontSize: 15)),
            Row(
              children: [
                Text("Bacangan, Sambit",style: TextStyle(color: Colors.black87,fontSize: 12),),
                Icon(Icons.arrow_drop_down,size: 15,),
                Spacer(),
                CircleAvatar(
                  radius: 20,
                  
                  foregroundImage:AssetImage('assets/images/batman-8510027_1280.png')
                )
              ],
               
            ),
            Column(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      Text("What would u like to Eat?",style: TextStyle(color: Colors.black54,fontSize: 13),)
                    ],
                  ),
                  
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text("Choose Category",style: TextStyle(fontSize: 15),),
            SizedBox(height: 8,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:List.generate(6, (index){
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CircleAvatar(
                          radius: 30,
                          foregroundImage: AssetImage(Database.scrollList[index]['image']),
                        ),
                      )
                    ],
                  );
                })

                  
                
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
               children: [
                Text("Main"),
                Spacer(),
                Text("Appetizer"),
                Spacer(),
                Text("Drinks"),
                Spacer(),
                Text("salads"),
                Spacer(),
                Text("Deserts"),
              
               ], 
              ),
              
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("Main Course",style: TextStyle(fontSize: 18),),
    Spacer(),
    Text("See All",style: TextStyle(fontSize: 18,color: Colors.red),),
              ],
            ),
            SizedBox(height: 5,),

            Expanded(
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              crossAxisSpacing: 8,mainAxisSpacing: 8,
              
              ), 
              itemBuilder: (context,index){
                return Stack(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: Database.gridList[index][Color]),
                    child: Padding(padding: EdgeInsets.all(10),
                    child: Text(Database.gridList[index]['text']),
                    ),
                    
                  ),
                  Positioned(
                    top: 40,
                    left: 30,
                    child: CircleAvatar(
                      radius: 115,
                      foregroundImage: AssetImage(Database.gridList[index]["image"]),
                    ),
                     )
                ],
              
                );
              }),
            )
            ],
            
            
          
            ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: [
           BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.discount_rounded),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
        ]
    
      ),
          
            
          
        
      
    );
  }
}