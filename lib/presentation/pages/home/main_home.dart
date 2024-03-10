import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const ejemploTxt = "This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and lush valleys. The Andes are also home to idk lol";

class HomeUI extends StatefulWidget {
  static const String name = 'home_page';
  const HomeUI({super.key, this.usuario});

  final String? usuario;

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context){
    Widget Page;
    switch (selectedIndex) {
      case 0:
        Page = const HomePage();
        break;
      case 1:
        Page = const Placeholder();
        break;
      case 2:
        Page = const Placeholder();
        break;
      case 3:
        Page = const Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back),
        onPressed: () => context.go('/login')),
        title: Text('Hola ${widget.usuario}'),
        centerTitle: true,
        ),

      body: Page,

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 132, 130, 130),
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Recent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset('assets/imagen.png', width: 270, height: 320, fit: BoxFit.fill,),
        ),
        const SizedBox(height: 40,),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Datos importantes", style: textTheme.bodyLarge,),
            const SizedBox(width: 140,), //82?
            Text("Ver todos", style: textTheme.bodyMedium,),
          ],
          
        ),
        Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 60,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: const <Widget> [
            BottonHome(texto: "Importante", selected: true,),
            BottonHome(texto: "no"),
            BottonHome(texto: "hola"),
          ],
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.fromLTRB(40,0,40,0),
        child: Text(ejemploTxt, style: textTheme.bodySmall,)
      ),
      ],
    );
  }
}

class BottonHome extends StatelessWidget {
  final String texto;
  final bool selected;

  const BottonHome({
    super.key,
    this.texto = "default",
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: 160,
        //color: Colors.red,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: selected ? Colors.black : const Color.fromARGB(255,251, 251, 251)),
          onPressed: () {
            
          },
          child: Text( texto, style: selected ? textTheme.displaySmall?.copyWith(color: Colors.white) : textTheme.displaySmall?.copyWith(color: Colors.grey), )
        ),
      ),
    );
  }
}