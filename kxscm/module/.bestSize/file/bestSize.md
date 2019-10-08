## .bestSize.PRICEDOMSIZE

## .bestSize.SIZEDOMSIZE

## .bestSize.createArrayTable


 Creates a random table of array price and size columns


**Parameter(s):**

|Name|Type|Description|
|---|---|---|
|N|long|The number of rows|
|M|long|The number of element each price/size column should contain|

**Returns:**

|Name|Type|Description|
|---|---|---|
|&lt;returns&gt;|table|Returns a table of two long array columns|

## .bestSize.createMultiColTable


 Creates a random table of multiple price and size columns


**Parameter(s):**

|Name|Type|Description|
|---|---|---|
|N|long|The number of rows|
|pCols|symbol[]|list of price column names|
|sCols|symbol[]|list of size column names|

**Returns:**

|Name|Type|Description|
|---|---|---|
|&lt;returns&gt;|table|Returns a table of int colums|

## .bestSize.createTable


 Creates a random table


**Parameter(s):**

|Name|Type|Description|
|---|---|---|
|N|long|The number of rows|

**Returns:**

|Name|Type|Description|
|---|---|---|
|&lt;returns&gt;|table|table of colums pA, pB, sA, sB of type long|