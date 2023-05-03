import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    //DefaultTabController: This should be used for most simple use cases.
    // Place the TabBar widget as the bottom property of AppBar.
    // Provide TabBarView in the body of the AppBar .
    return DefaultTabController(
      // length define Tabs in appBar ,
      //we can customize it according to our needs
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text('WhatsApp'),
            bottom:const TabBar(
              // indicatorWeight: 3,
              tabs: [
                Tab(
                    child: Icon(Icons.camera_alt)
                ),
                Tab(
                    child: Text('chats')
                ),
                Tab(
                    child: Text('Status')
                ),
                Tab(
                    child: Text('calls')
                ),
              ],
            ),
              actions:[
              const Icon(Icons.search),
              const SizedBox(width: 10,),
              PopupMenuButton(
             icon:const Icon(Icons.more_horiz_outlined),
             itemBuilder: (context)=>[
               const PopupMenuItem(
                 value: 1,
                   child: Text('setting'),
               ),
               const PopupMenuItem(
                 value: 2,
                 child: Text('New Group'),
               ),
               const PopupMenuItem(
                 value: 1,
                 child: Text('Logout'),
               )
             ]),
              const SizedBox(width: 10,)
            ],
          ),
          body: TabBarView(
            children:  [
              const Text('Camera'),
             //Chats
             ListView.builder(
               itemCount: 20,
                 itemBuilder: (context, index){
                   return const ListTile(
                     title: Text("Hasnain"),
                     subtitle: Text('Hi, whatsup men'),
                     trailing: Text('3:50 pm'),
                     leading: CircleAvatar(
                       backgroundImage: NetworkImage('https://images.pexels.com/photos/2773977/pexels-photo-2773977.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                     ),
                   );
                 }),
              //Status
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: const Text("Hasnain"),
                      subtitle: const Text('30m ago'),
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          )
                        ),
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage('https://images.pexels.com/photos/2773977/pexels-photo-2773977.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        ),
                      ),
                    );
                  }),
              // Calls
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return  ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage('https://images.pexels.com/photos/2773977/pexels-photo-2773977.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      ),
                      title: const Text("Hasnain"),
                      subtitle: Text(index /2==0? "You missed call" : "'You missed video call'"),
                      trailing: Icon(index /2 == 0 ? Icons.phone : Icons.video_call),
                    );
                  }),
            ],
          ),
        ),
    );
  }
}
