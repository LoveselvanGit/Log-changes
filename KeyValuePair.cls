 
 /*------------------------------------------------------------------------
    File        : KeyValuePair
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Anbu
    Created     : Thu Mar 07 21:09:06 EST 2019
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Logger.KeyValuePair: 
    DEFINE PUBLIC PROPERTY KeyName AS CHARACTER INITIAL "" NO-UNDO PUBLIC GET. PUBLIC SET.
    DEFINE PUBLIC PROPERTY KeyValue AS CHARACTER INITIAL "" NO-UNDO PUBLIC GET. PUBLIC SET.
END CLASS.