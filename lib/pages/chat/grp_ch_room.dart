import 'package:demtrav/pages/chat/activity.dart';
import 'package:demtrav/pages/chat/budget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demtrav/pages/chat/info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GroupChatRoom extends StatelessWidget {
  final String groupChatId, groupName;

  GroupChatRoom({required this.groupName, required this.groupChatId, Key? key})
      : super(key: key);

  final TextEditingController _message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        await currentUser.reload();

        // Retrieve the user again after the reload
        currentUser = _auth.currentUser;

        if (currentUser != null) {
          String senderEmail = currentUser.displayName ?? 'Anonymous';

          Map<String, dynamic> chatData = {
            'sendBy': senderEmail,
            'message': _message.text,
            'type': 'text',
            'time': FieldValue.serverTimestamp(),
          };

          _message.clear();

          await _firestore
              .collection('groups')
              .doc(groupChatId)
              .collection('chats')
              .add(chatData);
        } else {
          print('User is null after reload.');
        }
      } else {
        print('User is not authenticated.');
      }
    }
  }

  void openItinerary(BuildContext context) {
    // Navigate to the ViewBudget page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => activity(), // Replace ViewBudget with your actual class name
      ),
    );
  }

  void openActivity(BuildContext context) {
    // Navigate to the Activity page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => activites(), // Replace Activity with your actual class name
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
        actions: [
          IconButton(
            onPressed: () => openActivity(context),
            icon: Icon(
              Icons.public, // Globe icon
              color: Colors.blue, // Blue color
              size: 32.0, // Larger size
            ),
          ),
          IconButton(
            onPressed: () => openItinerary(context),
            icon: Icon(
              Icons.attach_money, // Bill icon
              color: Colors.green, // Green color
              size: 30.0, // Slightly larger size
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => GroupInfo(
                  groupName: groupName,
                  groupId: groupChatId,
                ),
              ),
            ),
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 1.27,
              width: size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('groups')
                    .doc(groupChatId)
                    .collection('chats')
                    .orderBy('time')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> chatMap =
                            snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;

                        return messageTile(size, chatMap);
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Container(
              height: size.height / 10,
              width: size.width,
              alignment: Alignment.center,
              child: Container(
                height: size.height / 12,
                width: size.width / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height / 17,
                      width: size.width / 1.3,
                      child: TextField(
                        controller: _message,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.photo),
                          ),
                          hintText: "Send Message",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: onSendMessage,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageTile(Size size, Map<String, dynamic> chatMap) {
    return Builder(builder: (context) {
      if (chatMap['type'] == "text") {
        return Container(
          width: size.width,
          alignment: chatMap['sendBy'] == _auth.currentUser?.email
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  chatMap['sendBy'] ?? 'Anonymous',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height / 200,
                ),
                Text(
                  chatMap['message'] ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (chatMap['type'] == "img") {
        return Container(
          width: size.width,
          alignment: chatMap['sendBy'] == _auth.currentUser?.email
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            height: size.height / 2,
            child: Image.network(
              chatMap['message'] ?? '',
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    });
  }
}
