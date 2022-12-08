
;Subtraction of the 2 16-bit Numbers
      LHLD 2005 ;Load the HL Register Pair with the contents of Memory Locations 2005 and 2006
                ;(Spoken Word/Number/Character) 
      XCHG      ;Exchange the contents of the HL Register Pair with the DE Register Pair
      LHLD 2007 ;Load the HL Register Pair with the contents of Memory Locations 2007 and 2008
                ;(Correct Enunciation of the Spoken Word/Number/Character) 
      MOV A,E   ;Copy the contents of Register E into the Accumulator
      SUB L     ;Subtract the contents of Register L from the contents of the Accumulator and 
                ;save the resultant difference in the Accumulator
                ;Essentially,this instruction performs the subtraction of 
                ;the lower order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair
      MOV L,A   ;Copy the contents of the Accumulator into Register L 
      MOV A,D   ;Copy the contents of Register D into the Accumulator 
      SBB H     ;Subtract the contents of Register H from the contents of the Accumulator 
                ;with Borrow and 
                ;save the resultant difference in the Accumulator
                ;Essentially,this instruction performs the subtraction of 
                ;the higher order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair taking into account the Borrow 
                ;generated from the subtraction of the lower order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair
      MOV H,A   ;Copy the contents of the Accumulator into Register H
                ;Thus,we've subtracted the 16 bit numbers stored in the DE and HL Register Pairs 
                ;and saved the resultant difference in the HL Register Pair 
      SHLD 2009 ;Store the contents of the HL Reg. Pair in Memory Locations 2009 and 2010 

;Comparison of the Difference with Tolerance Level 1 
      LHLD 2009 ;Load the HL Register Pair with the contents of Memory Locations 2009 and 2010
                ;(The Difference)
      XCHG      ;Exchange the contents of the HL Register Pair with the DE Register Pair
      LXI H,0005H ;Load the HL Register Pair with 0005H
                  ;(= Tolerance Level 1)
      MOV A,E   ;Copy the contents of Register E into the Accumulator
      SUB L     ;Subtract the contents of Register L from the contents of the Accumulator and 
                ;save the resultant difference in the Accumulator
                ;Essentially,this instruction performs the subtraction of 
                ;the lower order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair
      MOV L,A   ;Copy the contents of the Accumulator into Register L 
      MOV A,D   ;Copy the contents of Register D into the Accumulator 
      SBB H     ;Subtract the contents of Register H from the contents of the Accumulator 
                ;with Borrow and 
                ;save the resultant difference in the Accumulator
                ;Essentially,this instruction performs the subtraction of 
                ;the higher order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair taking into account the Borrow 
                ;generated from the subtraction of the lower order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair
      MOV H,A   ;Copy the contents of the Accumulator into Register H
                ;Thus,we've subtracted the 16 bit numbers stored in the DE and HL Register Pairs 
                ;and saved the resultant difference in the HL Register Pair 
      JNZ TOL2  ;If Diff > or not equal to 0005H,
      STC       ;check whether it's within the range of Tolerance Level 2
      JNC TOL2 
      MVI A,07H ;Light up all the 3 LEDs = EXCELLENT
      OUT 00FAH
      HLT       ;Stop the processing of the program: Terminate the program


;Comparison of the Difference with Tolerance Level 2
TOL2: LHLD 2009 ;Load the HL Register Pair with the contents of Memory Locations 2009 and 2010
                ;(The Difference)
      XCHG      ;Exchange the contents of the HL Register Pair with the DE Register Pair
      LXI H,000AH ;Load the HL Register Pair with 000AH
                  ;(= Tolerance Level 2)
      MOV A,E   ;Copy the contents of Register E into the Accumulator
      SUB L     ;Subtract the contents of Register L from the contents of the Accumulator and 
                ;save the resultant difference in the Accumulator
                ;Essentially,this instruction performs the subtraction of 
                ;the lower order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair
      MOV L,A   ;Copy the contents of the Accumulator into Register L 
      MOV A,D   ;Copy the contents of Register D into the Accumulator 
      SBB H     ;Subtract the contents of Register H from the contents of the Accumulator 
                ;with Borrow and 
                ;save the resultant difference in the Accumulator
                ;Essentially,this instruction performs the subtraction of 
                ;the higher order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair taking into account the Borrow 
                ;generated from the subtraction of the lower order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair
      MOV H,A   ;Copy the contents of the Accumulator into Register H
                ;Thus,we've subtracted the 16 bit numbers stored in the DE and HL Register Pairs 
                ;and saved the resultant difference in the HL Register Pair 
      JNZ TOL3  ;If Diff > or not equal to 000AH,
      STC       ;check whether it's within the range of Tolerance Level 3
      JNC TOL3  
      MVI A,03H ;Light up 2 of the LEDs = GOOD
      OUT 00FAH
      HLT       ;Stop the processing of the program: Terminate the program


;Comparison of the Difference with Tolerance Level 3
TOL3: LHLD 2009 ;Load the HL Register Pair with the contents of Memory Locations 2009 and 2010
                ;(The Difference)
      XCHG      ;Exchange the contents of the HL Register Pair with the DE Register Pair
      LXI H,000FH ;Load the HL Register Pair with 000FH
                  ;(= Tolerance Level 3)
      MOV A,E   ;Copy the contents of Register E into the Accumulator
      SUB L     ;Subtract the contents of Register L from the contents of the Accumulator and 
                ;save the resultant difference in the Accumulator
                ;Essentially,this instruction performs the subtraction of 
                ;the lower order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair
      MOV L,A   ;Copy the contents of the Accumulator into Register L 
      MOV A,D   ;Copy the contents of Register D into the Accumulator 
      SBB H     ;Subtract the contents of Register H from the contents of the Accumulator 
                ;with Borrow and 
                ;save the resultant difference in the Accumulator
                ;Essentially,this instruction performs the subtraction of 
                ;the higher order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair taking into account the Borrow 
                ;generated from the subtraction of the lower order 8 bits of the nos
                ;stored in the DE Register Pair and the HL Register Pair
      MOV H,A   ;Copy the contents of the Accumulator into Register H
                ;Thus,we've subtracted the 16 bit numbers stored in the DE and HL Register Pairs 
                ;and saved the resultant difference in the HL Register Pair 
      JNZ NTOL  ;If Diff > or not equal to 000FH, jump to NTOL
      STC
      JNC NTOL
      MVI A,01H ;Light up 1 of the LEDs = AVERAGE
      OUT 00FAH
      HLT       ;Stop the processing of the program: Terminate the program


NTOL: MVI A,00H ;Don't light up any LED at all = NEEDS IMPROVEMENT
      OUT 00FAH
      HLT       ;Stop the processing of the program: Terminate the program

