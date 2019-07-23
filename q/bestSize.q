PRICEDOMSIZE:  5;
SIZEDOMSIZE: 100;

createTable: {[N]
    :([] pA: N?PRICEDOMSIZE; pB: N?PRICEDOMSIZE; 
         sA: N?SIZEDOMSIZE;  sB: N?SIZEDOMSIZE)};

createMultiColTable: {[N; pCols; sCols]
   M: count pCols;
   if[not M = count sCols;
      '"length of price and size column names must be equal"];
  :flip (pCols, sCols)!raze N cut'(M*N)?'PRICEDOMSIZE, SIZEDOMSIZE};


createArrayTable: {[N; M]
   rowLength: 1 + N?M;
   :([] price: rowLength ?\: PRICEDOMSIZE; 
         size: rowLength ?\: SIZEDOMSIZE)};


bestSizeIF: {[pA; pB; sA; sB] 
  if[pA = pB; 
      :sA + sB]; 
	:$[pA > pB; sA; sB]};

bestSizeWHERE: {[pA; pB; sA; sB] 
  p: pA, pB;
  :sum (sA, sB) 
     where p = max p};


bestSizeMULT: {[pA; pB; sA; sB] 
  p: pA, pB;
  :sum (sA, sB) * 
     p = max p};


bestSizeWSUM: {[pA; pB; sA; sB] 
  p: pA, pB;
  :(sA, sB) wsum 
     p = max p};

bestSizeDotsch: {[pA; pB; sA; sB] 
   (sA * pA >= pB) + sB * pA <= pB};


bestSizeIF_V: {[pA; pB; sA; sB] 
   ?[pA = pB;
       sA + sB;
       ?[pA > pB; sA; sB]]};    

bestSizeMULT_V: {[pA; pB; sA; sB]
      p: (pA; pB);        // 2 x N
      :sum (sA; sB) * 
         p =\: max p};         

bestSizeMULT_V_N2_ver1: {[pA; pB; sA; sB]
      p: flip (pA; pB);   // N x 2
      :sum each flip[(sA; sB)] * 
         p = max each p};

bestSizeMULT_V_N2_ver2: {[pA; pB; sA; sB]
      p: pA ,' pB;
      :sum each (sA ,' sB) * 
         p = max each p};


bestSizeWSUM_V: {[pA; pB; sA; sB]
   p: (pA; pB);
   :(sA; sB) wsum
      p =\: max p};

bestSizeWSUM_V_N2_ver1: {[pA; pB; sA; sB]
   p: flip (pA; pB);
   :flip[(sA; sB)] wsum' 
      p = max each p};

bestSizeWSUM_V_N2_ver2: {[pA; pB; sA; sB]
   p: pA ,' pB;
   :(sA ,' sB) wsum' 
      p = max each p};



bestSizeWSUM_G: {[p; s]
   :s wsum p =\: max p};

bestSizeWSUM_G_N2: {[p; s]
   :s wsum' p = max each p};
