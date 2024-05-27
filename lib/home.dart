
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'AI.dart';
import 'message.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Message> _messages = <Message>[];
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar:AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title:   Text(AppLocalizations.of(context)!.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget> [
          Flexible(child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (_, int index) => _getItem(_messages[index]),
          ),
          ),
          Container(child: Row(
              children:<Widget> [
                Flexible(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: (String value) {
                      _senderMessage(value);
                    },
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white60,
                          ),
                        ),

                        hintText: AppLocalizations.of(context)!.send,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _senderMessage(_textController.text),
                ),
              ]
          )),
        ],
      ),

    );

  }

  Widget _getItem(Message message) {
    return Container(
      color: message.isSend ? Colors.tealAccent : Colors.amberAccent,
      margin: message.isSend
          ? const EdgeInsets.fromLTRB(80, 8, 4, 4)
          : const EdgeInsets.fromLTRB(4, 8, 80, 4),
      child: message.isSend
          ? _getMyListTile(message)
          : _getAssistentListTile(message),
    );
  }

  Widget _getMyListTile(Message message) {
    return ListTile(
      leading: Icon(Icons.face),
      title: Text(message.text,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 18)
      ),
      subtitle: Text(message.date,
          textAlign: TextAlign.left),
    );
  }

  Widget _getAssistentListTile(Message message) {
    return ListTile(
      trailing: Icon(Icons.assistant),
      title: Text(
        message.text,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(message.date,
          textAlign: TextAlign.right),
    );
  }

  Future<void> _senderMessage(String question) async {
    final DateTime questionTime = DateTime.now();
    final String formattedQuestionDate = DateFormat('yyyy-MM-dd – kk:mm').format(questionTime);

    final String answer = await AI().getAnswer(question.toLowerCase());

    _textController.clear();
    final DateTime answerTime = DateTime.now();
    final String formattedAnswerDate = DateFormat('yyyy-MM-dd – kk:mm').format(answerTime);
    setState(() {
      _messages.insert(0, Message(text: question, isSend: true, date: formattedQuestionDate));
      _messages.insert(0, Message(text: answer, isSend: false, date: formattedAnswerDate));
    });
  }
}


