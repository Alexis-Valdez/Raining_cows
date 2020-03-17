class vaca{
  float w;
  float h;
  Body b;
  
  vaca( float x_, float y_, float w_, float h_){
    w = w_;
    h = h_;
    BodyDef bd = new BodyDef();
    Vec2 posicionInicial = new Vec2(x_,y_);
    Vec2 posicionEnMundo = mundo.coordPixelsToWorld(posicionInicial);
    bd.position.set(posicionEnMundo);
    bd.type = BodyType.DYNAMIC;
    b = mundo.createBody(bd);
    b.setLinearVelocity(new Vec2(random(-2,2),random(10)));
    b.setAngularVelocity(random(-2,2));
    PolygonShape ps = new PolygonShape();
    float ancho = mundo.scalarPixelsToWorld(w_);
    float alto = mundo.scalarPixelsToWorld(h_);
    ps.setAsBox(ancho/2,alto/2);
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 0.3;
    fd.restitution = 0.4;
    fd.density = 2;
    b.createFixture(fd);
  }
  
  void display(){
      Vec2 posicion = mundo.getBodyPixelCoord(b);
      float angulo = b.getAngle();
      pushMatrix();
      translate(posicion.x,posicion.y);
      rotate(-angulo);
      rectMode(CENTER);
      noStroke();
      noFill();
      ellipse(0,0,w,h);
      image(vaca,-70,-50);
      popMatrix();
  }

}
