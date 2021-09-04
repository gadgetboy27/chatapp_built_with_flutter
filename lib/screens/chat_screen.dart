import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendlychat/config/palette.dart';

class ChatScreen extends StatefulWidget {
  @override 
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> 
  with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;
  @override
  void dispose() {
    for (ChatMessage message in _messages)
    message.animationController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FriendlyChatRooms"),
        elevation: 
        Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            new Divider(height: 1.0),
            new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
            ),
          ],
        ),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
        ? new BoxDecoration(
          border: new Border(
            top: new BorderSide(
              color: Palette.background),
          )
        )
          : null),
      );
    }
  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(        
            child: new TextField(
            controller: _textController,
            onChanged: (String text) {
              setState(() {
                _isComposing = text.length > 0;
              });
            },
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration.collapsed(
              hintText: "Send a Message"),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: Theme.of(context).platform == TargetPlatform.iOS ?
            new CupertinoButton(
              child: new Icon(Icons.arrow_upward),
              onPressed: _isComposing
                ? () => _handleSubmitted(_textController.text)
                : null,) :
            new IconButton(
              icon: new Icon(Icons.send),
              onPressed: _isComposing
              ? () => _handleSubmitted(_textController.text)
              : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text, 
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 900),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({
    required this.text, 
    required this.animationController});
    final String text;
    final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(                                    //new
    sizeFactor: new CurvedAnimation(                              //new
        parent: animationController, curve: Curves.easeInCirc),      //new
    axisAlignment: 0.0,                                           //new
    child: new Container(                                    //modified
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(currentUser[0])),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(currentUser, style: Theme.of(context).textTheme.subtitle1),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      )                                                           //new
    );
  }
}