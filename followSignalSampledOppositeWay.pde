//followSignalSampledOppositeWay.pde


void followSignalSampledOppositeWay(int ratioTimeFrame){
  
if (formerDecayTime>decayTime){
  frameCountBis=frameCountBis+1;
  } 
  formerDecayTime = decayTime;
  decayTime = millis()%100;// incremente frameCountBis+1 each 100 millisecondes
 
  int delayRatio=ratioTimeFrame;

     //samplingMovement(2);
      samplingMovementPro();
  //    keyReleasedfollowSignal(); useless  phseShifting is controlled in keyRelesead
      float deltaFollow = TWO_PI; // not used
     //here in a previous function we could change the ball followed if the space of phase between phases[0] and phase 9 is more than 360° for example

 //     phases[0][frameCountBis % nbMaxDelais]= net.phase[networkSize-1]-0;
 /*
 
  if (movementInterpolated<0) {
 
   DataToDueCircularVirtualPosition[2]= int (map (movementInterpolated, 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[2]=net.phase[2];
    net.phase[2]= map (DataToDueCircularVirtualPosition[2], numberOfStep, 0, 0, -TWO_PI);
    net.phase[2]= net.phase[2]%TWO_PI;
     print (" movInter <0 "); print (2);  print ("  "); print ( net.phase[2]);
//   phaseMapped[i] = net.phase[i];
  movementInterpolated = net.phase[2];

//    phaseMapped[i]= TWO_PI- (phases[i-2][frameCountBis % nbMaxDelais]); // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
  //  phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
   // drawBallOppositeWay(  i, phases[i+0][frameCountBis % nbMaxDelais] );
   print ("  movInter<0  "); print (2); print ( " ");   println (  movementInterpolated  ); 
}
   
 
  else
  
    DataToDueCircularVirtualPosition[2]= (int) map (movementInterpolated, 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[2]=net.phase[2];
    net.phase[2]= map (DataToDueCircularVirtualPosition[2], 0, numberOfStep, 0, TWO_PI);
    net.phase[2]= net.phase[2]%TWO_PI;
    movementInterpolated = net.phase[2];
    print (" movInter>0 "); print (2);  print ("  "); println ( net.phase[2]);
 
 */
 
 
     println ( "  movementInterpolated ", movementInterpolated,
             " oldmovementInterpolated ", oldMovementInterpolated );
  /*           
      if (oldYsampled>ySampled) {  
        
        
   //     movementInterpolated = movementInterpolated - PI;
      movementInterpolated = movementInterpolated + PI + TWO_PI;
      movementInterpolated = movementInterpolated % TWO_PI;
             
   }
  */    
   
     phases[0][frameCountBis % nbMaxDelais]=movementInterpolated;
     println ( " net.phase[networkSize-1] ",  net.phase[networkSize-1] , " movementInterpolated " , movementInterpolated );
  //    drawBallOppositeWay(0, phases[0][frameCountBis % nbMaxDelais]); //networkSize-5 affiche le point 0. NE PAS AFFICHER SINON IL APPARAIT EN DOUBLE

   
    for (int i = 1; i < networkSize; i+=1) { // 1 follow phase 0
    debug ="Normal follow opp2Way ";
//    print (" iopp2Way i-1 "); print (i-1);  print ("  "); println (phases[i-1][frameCountBis % nbMaxDelais]);
//    print (" i "); print (i);  print ("  "); print (phases[i][frameCountBis % nbMaxDelais]);   print ("  "); print (phases[i][frameCountBis % nbMaxDelais]);
//    print (" net.phase 11 ");  print (" =0?  "); println (net.phase[networkSize-1]-0);
    
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

 //     drawBall(i, phaseMapped[i] );
    drawBallOppositeWay( i, phases[i+0][frameCountBis % nbMaxDelais] );
    
//    print (" iopp2Way 0 "); print (i-1);  print ("  "); println (phases[i-1][frameCountBis % nbMaxDelais]);

  }
    print (" iopp2Way 0 "); print (2);  print ("  "); println (phases[0][frameCountBis % nbMaxDelais]);
    print (" iopp2Way 1 "); print (1);  print ("  "); println (phases[1][frameCountBis % nbMaxDelais]);
/*  
    for (int i = 2; i < 3; i+=1) { // 2 follow phase 1
    debug ="Normal follow opp1Way "; print (" iopp1Way "); print (i);
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
   followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11*-1));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6
//    followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
    drawBallOppositeWay( i, phases[i+0][frameCountBis % nbMaxDelais] );

  }
  
     for (int i = 3; i < 4; i+=1) { // 3 follow phase 2
    debug ="Normal follow opp2Way "; print (" iopp2Way "); print (i);  print ("  ");
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
    drawBallOppositeWay( i, phases[i+0][frameCountBis % nbMaxDelais] );
  }
  
    for (int i = 4; i < 5; i+=1) { // 4 follow phase 3
    debug ="Normal follow opp1Way "; print (" iopp1Way "); print (i);
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11*-1));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
    drawBallOppositeWay( i, phases[i+0][frameCountBis % nbMaxDelais] );
  }
     
    for (int i = 5; i < 6; i+=1) { // 
    debug ="Normal follow opp2Way "; print (" iopp2Way "); print (i);  print ("  ");
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
    drawBallOppositeWay( i, phases[i+0][frameCountBis % nbMaxDelais] );

  }
  
    for (int i = 6; i < 7; i+=1) { // 
    debug ="Normal follow opp1Way "; print (" iopp1Way "); print (i);
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11*-1));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
    drawBallOppositeWay( i, phases[i+0][frameCountBis % nbMaxDelais] );

  }
  
     for (int i = 7; i < 8; i+=1) { //
    debug ="Normal follow opp2Way "; print (" iopp2Way "); print (i);  print ("  ");
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
    drawBallOppositeWay( i, phases[i+0][frameCountBis % nbMaxDelais] );

  }
  
    for (int i = 8; i < 9; i+=1) { // 
    debug ="Normal follow opp1Way "; print (" iopp1Way "); print (i);
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11*-1));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
    drawBallOppositeWay( i, phases[i+0][frameCountBis % nbMaxDelais] );

  }
  
    for (int i = 9; i < 10; i+=1) { // 
    debug ="Normal follow opp1Way "; print (" iopp1Way "); print (i);
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
    drawBallOppositeWay( i, phases[i+0][frameCountBis % nbMaxDelais] );

  }
  */
  println(frameCount + ": " + ( debug ));


  if (frameCount > nbMaxDelais/10 && firstFollowingLast == true && abs(diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais])) < deltaFollow ) {
    colorMode(RGB, 255, 255, 255);
    fill( 0, 0, 255 );
 //   println("diffangle" + ": " + diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais]));
//    firstFollowingStarted = true;
    debug ="First follow last";
 //   firstFollowingLast = false;
    println (debug);
  }

  if (firstFollowingStarted) {
    colorMode(RGB, 255, 255, 255);
    fill( 255, 0, 0 );
    debug ="firstFollowingStarted";
  //**  follow(nbBall-1, 0, delayTimeFollowPhase11*frameRatio/ratioTimeFrame , phaseShiftingFollowPhase11);  // Modifier les deux derniers paramètres : délais et phase  delayTimeFollowPhase11, 
  //***  drawBall(0, phases[0][frameCount % nbMaxDelais]);
 //   println ("PHASE MAPPED firstFollowing ");
 //   println("diffangle" + ": " + diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais]));
    
  }
  
   for (int i = 2; i < 3; i+=1) {// display ball   (nbBall/2)-0; i < nbBall; i++   for (int i = 3; i < networkSize-0; i+=1) {
 //    print (net.oldPhase[i]); print (" 12448 ");   println (net.phase[i]); 
 //   net.oldPhase[i]=phaseMapped[i];
 
 //    phaseMapped[i]= TWO_PI- (phases[i-2][frameCountBis % nbMaxDelais]); // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
  //   phaseMapped[i]=  (phases[i-2][frameCountBis % nbMaxDelais]); // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
/*
 if (movementInterpolated<0) {
 
   DataToDueCircularVirtualPosition[i]= int (map (movementInterpolated, 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
    net.phase[i]= net.phase[i]%TWO_PI;
     print (" iopp3Way >0 "); print (i);  print ("  "); println ( net.phase[i]);
   phaseMapped[i] = net.phase[i];
//    phaseMapped[i]= TWO_PI- (phases[i-2][frameCountBis % nbMaxDelais]); // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
  //  phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
   // drawBallOppositeWay(  i, phases[i+0][frameCountBis % nbMaxDelais] );
   print ("  BEFBEF<0 phaseMapped[i]  "); print (i); print ( " ");   println ( phaseMapped[i]  ); 
}
   
 
  else
  
    DataToDueCircularVirtualPosition[i]= (int) map (movementInterpolated, 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
    net.phase[i]= net.phase[i]%TWO_PI;
     phaseMapped[i] = net.phase[i];
    print (" BEFBEF>0 phaseMapped[i] "); print (i);  print ("  "); println ( net.phase[i]);
 */
 
 }
 
  
  
 
   for (int i = 0; i < networkSize-0; i+=1) {// display ball   (nbBall/2)-0; i < nbBall; i++   for (int i = 3; i < networkSize-0; i+=1) {
 //    print (net.oldPhase[i]); print (" 12448 ");   println (net.phase[i]); 
 //   net.oldPhase[i]=phaseMapped[i];
    phaseMapped[i]=phases[i-0][frameCountBis % nbMaxDelais]; // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
  //  phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
   // drawBallOppositeWay(  i, phases[i+0][frameCountBis % nbMaxDelais] );

   
 }
 
 
  if (formerFormerKey == '#' || formerKeyMetro == 'J') {
    
     print (" iopp3Way >0 "); print (2);  print ("  "); println ( net.phase[2]);
     print (" iopp3Way >0 "); print (3);  print ("  "); println ( net.phase[3]);
    
      for (int i = 0; i < networkSize-0; i+=1) { 
        
  ////*****  phaseMappedFollow[i] = phaseMapped[i];
 //   phaseMapped[i] = phaseMappedFollow[i]+phaseMapped[i];
   
    if (phaseMapped[i]<0){
      
 //   phaseMapped[i] = phaseMappedFollow[i]+phaseMapped[i];
    phaseMapped[i] = phaseMapped[i]%TWO_PI;
    DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
    net.phase[i]= net.phase[i]%TWO_PI;
//**     print (" iopp3Way >0 "); print (i);  print ("  "); println ( net.phase[i]);
  }
       
   else
//    phaseMapped[i] = phaseMappedFollow[i]-phaseMapped[i];
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
    net.phase[i]= net.phase[i]%TWO_PI;
 //**     print (" iopp3Way <0 "); print (i);  print ("  "); println ( net.phase[i]);
  }
  
 
  
 }
  /*
   
    if (formerFormerKey != '#' ) {
    if (formerKeyMetro == 'J' ) {
     phasePattern();
     
    for (int i = 2; i < networkSize-0; i+=1) { 
  //    print ("  BEF phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
    phaseMappedFollow[i]= net.phase[i];
    phaseMapped[i] =  phaseMapped[i]+phaseMappedFollow[i];  // add offset given by pendularPattern
    phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
  //  print ("  phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
   
    if (phaseMapped[i]<0){
   
     DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
 //    net.oldPhase[i]=phaseMapped[i];
     net.oldPhase[i]=net.phase[i];
     net.phase[i]= phaseMapped[i];
       }
       
   else
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
 //   net.oldPhase[i]=phaseMapped[i];
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= phaseMapped[i];

   }
  }
  
 }
 
 */
 
 
 
   if (keyCode == BACKSPACE ) {
    
      for (int i = 0; i < networkSize-0; i+=1) { 
        println (" ALIGN MTF " );
        
  ////*****  phaseMappedFollow[i] = phaseMapped[i];
  //  phaseMappedFollow[i]=0;
  //  net.phase[i]=0;
    phaseMapped[i] = phases[i-0][frameCountBis % nbMaxDelais]+0; // to aligin ball with the followed one
   
    if (phaseMapped[i]<0){
   
    DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
      net.oldPhase[i]=phaseMapped[i];
     net.phase[i]= phaseMapped[i];
       }
        
   else
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
       net.oldPhase[i]=phaseMapped[i];
     net.phase[i]= phaseMapped[i];
  }
 }
 
    for (int i = 0; i < networkSize-0; i+=1) {
 //   print (" iOpp "); print (i);  print (" "); println (degrees (net.phase[i]));
  } 
  sendToTeensyTurnOnDriver();
  }
