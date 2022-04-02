import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shlink/UserInterface/Authenticate/authenticate_page.dart';
import 'package:shlink/UserInterface/ChatMain/post_page.dart';

class ChatPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () async
            {
              await Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return WebAuthenticatePage();
                }),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async
        {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return AddPostPage();
            }),
          );
        },
      ),
    );
  }
}