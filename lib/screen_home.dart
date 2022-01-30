import 'package:flutter/material.dart';
import 'package:sample_project_2/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
bool islogout=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan[900],
        foregroundColor: Colors.blue[200],
        actions: [
    
          IconButton(
            onPressed: () async{
             await showDialog(context:context , builder: (ctx){
          return     AlertDialog(
                 title: const Text('Log Out ?'),
                 actions: [
                   ElevatedButton(onPressed: (){
                     Navigator.of(context).pop();
                   }, child:const Text('No')),
                   ElevatedButton(onPressed: (){
                     Navigator.of(context).pop();
                     islogout=true;
                   }, child:const Text('Yes'))
                 ],
               );
             });
             if(islogout==true){
               logout(context);
             }           
            },
            icon: const Icon(Icons.logout),
            splashRadius: 27,
            iconSize: 25,
          ),
          
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
        itemBuilder: (ctx, index) {
          return ListTile(
            onTap: () {

            },
            title: Text("person ${index+1}"),
            subtitle: Text('Hey....whatppp!'),
            leading: const CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(
                  'https://t4.ftcdn.net/jpg/02/15/84/43/240_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg'),
            ),
            trailing:  Text('${index+1}:${index+3} pm'),
          );
        },
        separatorBuilder: (ctx, index) {
          return const Divider();
        },
        itemCount: 11,
      )),
    );
  }

  logout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => LoginScreen()), (route) => false);
  }
}
