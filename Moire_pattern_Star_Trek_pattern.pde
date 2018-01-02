// Explanation of original Star Trek swirl creation here: http://www.startrekpropauthority.com/2009/03/tos-special-effects-spocks-science.html
// code from here: https://forum.processing.org/two/discussion/21597/star-trek-moire-pattern

Pattern pt1, pt2;
float angle = 0.0;
float k;
 
 
void setup(){
 
  size (600, 600);
  background (255);
  //sonido = new SoundFile(this, "tos_tricorder_scan.mp3");
  //sonido.loop();
 
}
void draw() {
 
  pushMatrix();
  if (key == 'd') {
  } else {
  background (255); //reestablece la pantalla   
  noLoop();
  pt1 = new Pattern(width/2, height/2, #FF0D00); // patrón de fondo que está fijo
  pt1.display();
  loop();
  angle += 0.004; // este valor determina la velocidad de rotación
  translate (width/2, height/2);
  rotate (angle); 
  pt2 = new Pattern(7, 7, #00BDFF); //patrón superior que se mueve
  pt2.display();
  }
 popMatrix();
 noLoop();
// ============== marco circular de la pantalla ==============
fill(0);
k = (0.552284749831*250); //valor de la constante por el radio de la circunferencia
beginShape();  
vertex(0, 0);
vertex(600, 0);
vertex(600, 600);
vertex(0, 600);
beginContour();
// la fórmula para aproximar al círculo las curvas de bezier es:
//4/3tan(PI/2n)
//donde n es el número de segmentos
//para 4 segmentos es 0.552284749831
vertex(50, 300);
bezierVertex(50, (height/2)+k, (width/2)-k, 550, 300, 550);
bezierVertex((width/2)+k, 550, 550, (height/2)+k, 550, 300);
bezierVertex(550, (height/2)-k, (width/2)+k, 50, 300, 50);
bezierVertex((width/2)-k, 50, 50, (height/2)-k, 50, 300);
endContour();
endShape();
  loop();
  // ============= fin del marco circular de la ventana ===========
}
  void keyPressed () {
    if (key == 'a') {
     noLoop();
    }
  }
 
 
// =======================================================
 
class Pattern { //patrón
  float p1, p2;
  int colores;
 
  Pattern(float p1_, float p2_, int colores_) { //fijan el centro del patrón
 
  p1 = p1_;
  p2 = p2_;
  colores = colores_;
 
  }
 
  void display() {
    pushMatrix();
    translate(p1, p2);  // centra el dibujo
      for (int i = 0; i < 180; i++) {  // repeticiones
        rotate(PI/90);    // rotación repetición
        fill (colores); //color de los radios
        noStroke (); //sin bordes
        triangle (0, 0, 500, -5, 500, 5); //tamaño de los radios
      }
     popMatrix();
 }
}