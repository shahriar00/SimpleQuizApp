import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:programingquiz/model.dart';

class programing extends StatefulWidget {
  const programing({Key? key}) : super(key: key);

  @override
  State<programing> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<programing> {
  var counter = 0;

  List questionbank = [Model.name("CSS means Cascading Style Sheets", true),
  Model.name("HTML means Hypertext Markup Language", true),
  Model.name("Python is a high-level programming language", true),
  Model.name("Java is a object-oriented programming language", true),
  Model.name("Dart is a client-optimized language", true),
  Model.name("JavaScript is the programming language of the Web", true),
  Model.name("C++ is a middle-level programming language", true),
  Model.name('C is a general-purpose programming language. ', true),
  Model.name("PHP is a server scripting language", true),
  Model.name("Linux is a open-source Unix-like operating systems", true)
  
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("ProgramingLearner",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        centerTitle: true,
        // actions: [
        //   IconButton(onPressed: (){
        //    TextFormField(
        //     decoration: InputDecoration(
        //       label: Text("searchdata"),
        //       border: InputBorder.none,
        //       hintText: "search data"

        //     ),

        //    );
        //   },icon: Icon(Icons.search),), 
        // ],
      ),
      drawer: programing(
        
      ),
      body: Builder(
        builder:(context)=> Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("images/image1.jpg",height: 150,width: 200,),
              )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.purple,style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Center(child: Text(questionbank.elementAt(counter).text,style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(onPressed: ()=>prev(),
                   color: Colors.blue,
                   child: Icon(Icons.arrow_back),
                  ),
                  RaisedButton(onPressed: ()=>cheackAnswer(true,context),
                  color: Colors.green,
                  child: Text("TRUE",style:TextStyle(fontSize: 15,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                  ),
                  RaisedButton(onPressed: ()=>cheackAnswer(false,context),
                  color: Colors.red,
                  child: Text("FALSE",style:TextStyle(fontSize: 15,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                  ),
                  RaisedButton(onPressed: ()=>next(),
                   color: Colors.blue,
                   child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
      
      
              Spacer()
      
            ],
          ),
        ),
      ),


    );
    
  }
  void cheackAnswer(bool userchoice,BuildContext context)
  {
    if(userchoice == questionbank[counter].check)
    {
      final snack = SnackBar(content: Text("Correct!!"),backgroundColor: Colors.green,);
      Scaffold.of(context).showSnackBar(snack);
      update();
      

    }
    else
    {
      final snack = SnackBar(content: Text("Incorrect!!"),backgroundColor: Colors.red,);
      Scaffold.of(context).showSnackBar(snack);
      update();
    }
  

  }
  void prev()
  {
    setState(() {
      counter = (counter-1)%questionbank.length;
    });


  }
  void next()
  {
    update();

  }
  void update()
  {
    setState(() {
      counter = (counter+1)%questionbank.length;
    });
  }
}