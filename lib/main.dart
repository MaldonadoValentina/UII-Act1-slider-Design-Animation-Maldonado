import 'package:flutter/material.dart';
import 'package:myapp/fadeanimation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int totalpage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: 'assets/imag/peluche.png',
            title: 'Peluche Eiden',
            descripcion:
                'Peluche del Protagonista Eiden:  ¡Tu nuevo amigo Eiden de peluche está aquí! Suave y tierno, es ideal para esos momentos de relax o para añadir un toque adorable a tu colección.',
          ),
          makePage(
            page: 2,
            image: 'assets/imag/pin.jpg',
            title: 'Pin Morvay',
            descripcion:
                'Pin "Feliz Cumpleaños Morvay" NU: Carnival: Pin "Feliz Cumpleaños" NU: Carnival: Pin redondo con el personaje Morvay de NU: Carnival comiendo un cupcake entre globos. ¡Personaliza tu estilo o colección con este diseño festivo!',
          ),
          makePage(
            page: 3,
            image: 'assets/imag/llavero.jpg',
            title: 'Llavero Aster',
            descripcion:
                'Llavero Acrílico "Celebración Festiva" NU: Carnival: Llavero vibrante con Aster chibi de NU: Carnival en atuendo festivo y charm de regalo. ¡Decora tus llaves o mochila con este diseño alegre!',
          ),
          makePage(
            page: 4,
            image: 'assets/imag/ligthtopper.png',
            title: 'LightStick Topper',
            descripcion:
                'Topper Luminoso "NEON" NU: Carnival: ¡Ilumina tu pasión! Este topper es el complemento perfecto para tu lightstick, creando un ambiente increíble en eventos o para decorar tu espacio.',
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, descripcion, page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [Colors.black.withAlpha(162), Colors.black.withAlpha(26)],
          ),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    page.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/${totalpage.toString()}',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      2,
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(
                            Icons.star,
                            color: const Color.fromARGB(255, 255, 255, 109),
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 255, 109),
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 255, 109),
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 255, 109),
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 255, 109),
                            size: 15,
                          ),
                        ),
                        Text('5.0', style: TextStyle(color: Colors.white70)),
                        Text(
                          '(2302)',
                          style: TextStyle(color: Colors.white38, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(
                        descripcion,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          height: 1.9,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('LEER MÁS', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
