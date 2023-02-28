void addSignalOneAndTwoQuater() {
 //   signal2 continue
 //   signal to split sinus
  // lfoPattern(); // if ive is not open  //lfoPattern(); // if Live is not open
    // if you dob't use this, uncomment signal2 in addSignalLfoPattern()
     textSize (100);
     text ("Change mode q, z, or stop progation with b ", -width-200, -height- 600 );
     text ("signal2 " + signal[2], -width-200, -height- 500 );
 //    text ("signal3 " + signal[3], -width-200, -height- 400 );
     text (" oldSignalToSplit " + oldSplitTime + " splitTime " +  splitTime + " timeLFO " + timeLfo,  -width-200, -height- 400 );
     text (" oldSignalToSplit " + oldSignalToSplit + " signalToSplit " +     signalToSplit + " timeLFO " + timeLfo,  -width-200, -height- 300 );
     text (" oscillatorChanged" + oscillatorChanged + " oscillatorChange " + oscillatorChange + " oscillatorChanging " + phaseKeptAtChange[oscillatorChanging], -width-200, -height- 200 );
     text (" propagationSpeed " + propagationSpeed + " key " + key + " startZ " + startZ, -width-200, -height- 100 );
      
   if (key=='q' || key=='b' || key=='z' ) { // q == addsignal
     letter = key;   
     }
     
  switch(letter) {
    case 'q': 
    doQ=true;
    doZ=false;
    startZ=false;
    break;
    case 'b': 
    doQ=false;
    break;
    case 'z': // change way of propagation
    doZ=true;
    doQ=true;
    break;
    }
// splitTimeOriginal(10.0);
// splitTimeQuater(30.0);
   splitTimeLfoQuater();
  addSignalLfoPatternQuater(); 
 
 formerFormerKey= formerKey;   
 formerKey=key;
 }
 
 void addSignalLfoPatternQuater()  { //|| doZ==false

     print ("  normal " + frameCount + " lfoPhase[1] " + lfoPhase[1] + " lfoPhase[2] " + lfoPhase[2]);    println (   ); 
  
  /*
  oscillatorChanging= (oscillatorChange-1);
  if (oscillatorChanging<= -1){
  oscillatorChanging= networkSize-1;
  }
 */
 //********POURQUOI DIFFERENT AU DEMARRAGE DE lA FONCTION
  if ( doZ==true )  { //oscillatorChanged==true &&
    oscillatorChanging= (oscillatorChange-1);
  if (oscillatorChanging<= -1){
  oscillatorChanging= networkSize-1;
  }
  if ( doZ==false )  { //oscillatorChanged==true &&
    oscillatorChanging= (oscillatorChange+1);
    oscillatorChanging=oscillatorChanging%networkSize-1;
  }

     phaseKeptAtChange[oscillatorChange]=newPosXaddSignal[oscillatorChanging];    //  enregistre sur l'oscillateur actuelle la position du precedent oscillateur
   } 
   


   
   if (doZ==true  ){    // oscillatorChange<=0 || networkSize-1
       startZ=true;
   }

     if ( startZ==true  )  {   // oscillatorChanged==true &&

     phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChanging];     // enregistre  sur l'oscillateur actuelle la position diametralement oppsé 
   
   }



    if (startZ==true  ){  // && oscillatorChanged==true

       LFO[oscillatorChanging] = phaseKeptAtChange[oscillatorChanging]+QUARTER_PI*0 ;  // on ajoute 
       dataMappedForMotor[oscillatorChanging]= (int) map (LFO[oscillatorChanging], 0, TWO_PI, 0, numberOfStep);  // le mappage est opposé
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
 
       newPosXaddSignal[oscillatorChanging]= map (dataMappedForMotor[oscillatorChanging], 0, numberOfStep, 0, TWO_PI);
     }
     
   if (doZ==false ){     // && oscillatorChanged==true
       LFO[oscillatorChanging] = phaseKeptAtChange[oscillatorChanging]-QUARTER_PI*1 ;  //
       dataMappedForMotor[oscillatorChanging]= (int) map (LFO[oscillatorChanging], TWO_PI, 0, 0, numberOfStep);
       println (" false phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
 
       newPosXaddSignal[oscillatorChanging]= map (dataMappedForMotor[oscillatorChanging], 0, numberOfStep, 0, TWO_PI);
     }
 
///////////////////// 
mapDataToMotor();
/*
 for (int k = 0; k < this.nbBalls; k++) 
    {
     
        drawBallGeneral(k, newPosXaddSignal[k] );
        
    } 
*/    
  }



  
void  splitTimeLfoQuater() {  // signalToSplit = lfoPhase3
 
//  lfoPattern();   // signalTosplit come from lfoPattern(). Signal of rotation come from Lfopattern too. Function is at the top 
    lfoPhase[1] = (0*PI + (frameCount / 5.0) * cos (1000 / 500.0)*-1)%TWO_PI;  // continue 0 to TWO_PI;
    lfoPhase[3] = map ((((cos  (frameCount / 30.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoidale lente
    lfoPhase[2] = map ((((cos  (frameCount / 100.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI); // sinusoidale rapide
    
    println (" forme d'onde lfoPhase[1] ", lfoPhase[1], "lfoPhase[2] ", lfoPhase[2], "lfoPhase[3]= signalTosplit ", lfoPhase[3]); 

    oldSignalToSplit=signalToSplit;
    signalToSplit= lfoPhase[1];
 
  if (oldSignalToSplit> signalToSplit ) {
  //  key = 'q' ; // when signal goes down --> propagation FRONT SIDE
  // timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) { // on est dans cette configuration avec  signalToSplit= lfoPhase[1]
//   key = 'z';  //  when signal goes down --> propagation BEHIND SIDE 
//   key = 'q' ;  // propagation in on the same way
//  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
    timeLfo= map (signalToSplit, 0, TWO_PI, 0, 1000);  // 0 to  // with lfoPhase[1]
 
  }

  int splitTimeLfo= int  (timeLfo%100);   // 100 is the size of the gate trigging the change of the ball  
   
      println ( " oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );
      print (" timeLfo "); print ( timeLfo );   print (" splittimeLfo "); println ( splitTimeLfo );


 if (doZ==false){  // case q
  if (oldSplitTimeLfo>splitTimeLfo){
 //     oldMemoryi=memoryi;
 //      memoryi=(memoryi+1);
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
      oscillatorChanged=true;
      }
    else { oscillatorChanged=false;
     } 
   //   memoryi=memoryi%networkSize;
      oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
     //    memoryi=0;
         oscillatorChange=0;
   }

  }
  
    if (doZ==true){ // case z
   if (  oldSplitTimeLfo>splitTimeLfo){
 //   oldMemoryi=memoryi;
 //   memoryi=(memoryi-1);
      oscillatorChange=oscillatorChange-1;
      oscillatorChanged=true;
   } 
    else { oscillatorChanged=false;
     } 
      if (oscillatorChange<=-1) {
//        memoryi=11;
//        oldMemoryi=2;
        oscillatorChange=networkSize-1;
   }
  }  
/*
  if ( oldOscillatorChange!=oscillatorChange )
  {
   oscillatorChanged=true;
  } 
  else 
   {oscillatorChanged=false;
    } 
*/
   oldSplitTimeLfo = splitTimeLfo;
             
}

 void  splitTimeQuater(float propagationSpeed) { 
   
  //  oldSignalToSplit=signalToSplit;
  
         signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1)%1;

//  splitTime=signal[2];
   
  if (oldSplitTime>splitTime){
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   //  key='q';
  } 
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
   //    formerDecayTimeLfo = decayTimeLfo; 
  //  oldSplitTime = splitTime;
    

//   int splitTimeLfo = millis()%150; // linear time  to change " oscillator " each 200 ms

    
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " signal[2] " + signal[2] + " oldSplitTime " + oldSplitTime + " splitTime " + splitTime );

   timeLfo = (int ) map (signal[2], 0, 1, 0, 1000); // linear time  to change " oscillator " each 200 ms
 
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " timeLfo   " + timeLfo );

/*  
  if ( mappingMode == " circular " ) {
      
    if (oldSignalToSplit> signalToSplit ) {
  timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) {  
  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
   }
   oldSignalToSplit=signalToSplit;
  }
*/ 
   oldSplitTime=splitTime;
    splitTime= int  (timeLfo%100);   
   //    println ( " ***************************************************    SPLIT TIME  decayTimeLfo     " + decayTimeLfo + " signalToSplit " + splitTime );
   //    println ( " ***************************************************    SPLIT TIME  oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );
  
         oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
         oscillatorChange=0;
         }
     // 
    //     print (" oscillatorChange "); println ( oscillatorChange ); 
      
}

void  splitTimeOriginal(float propagationSpeed) { 
   oldSplitTime = splitTime;  
     signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1)%1;
  //   key='b';
//  if (formerDecayTimeLfo>decayTimeLfo){
   if (oldSplitTime>splitTime){
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   //  key='q';
  } 
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
  //     formerDecayTimeLfo = decayTimeLfo; 
//
//   int splitTimeLfo = millis()%150; // linear time  to change " oscillator " each 200 ms

 //      signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1)%1;
    
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " signal[2] " + signal[2] );

 int  timeLfo = (int ) map (signal[2], 0, 1, 0, 1000); // linear time  to change " oscillator " each 200 ms
 
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " timeLfo   " + timeLfo );

/*  
  if ( mappingMode == " circular " ) {
      
    if (oldSignalToSplit> signalToSplit ) {
  timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) {  
  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
   }
   oldSignalToSplit=signalToSplit;
  }
*/ 
  //   oldSplitTime = splitTime;  
    splitTime= int  (timeLfo%100);   
   //    println ( " ***************************************************    SPLIT TIME  decayTimeLfo     " + decayTimeLfo + " signalToSplit " + splitTime );
   //    println ( " ***************************************************    SPLIT TIME  oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );
  
         oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
         oscillatorChange=0;
         }
     //    decayTimeLfo = splitTime;
    
    //     print (" oscillatorChange "); println ( oscillatorChange ); 
      
}
 


    
