
      MVI A,98H    ;Initialize the 8255
      OUT 03H

      MVI A,00H    ;Select Channel 0
      OUT 01H

      MVI A,00H    ;Start of Conversion (SOC) Signal 
      OUT 02H
      MVI A,03H
      OUT 02H
      MVI A,00H
      OUT 02H

LOOP: IN 02H       ;End of Conversion (EOC) Signal
      ANI 10H
      JZ LOOP
      
      MVI A,04H    ;Output Enable (OE) Signal
      OUT 02H
     
      IN 00H       ;Read the ADC's Output Data

      LXI H,2005
      MOV M,A      ;Store the data in a memory location (temporarily)

