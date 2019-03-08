 
 /*------------------------------------------------------------------------
    File        : LogMessage
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Anbu
    Created     : Thu Mar 07 21:12:41 EST 2019
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Logger.LogMessage: 
    DEFINE PROPERTY oKeyValuePair AS Logger.KeyValuePair NO-UNDO. GET. PRIVATE SET.
    DEFINE PROPERTY MessageStatement AS CHARACTER NO-UNDO. GET. PRIVATE SET.
    
     /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    CONSTRUCTOR PUBLIC LogMessage ( INPUT ipcMessageStatement AS CHARACTER,
                                    INPUT ipoKeyValuePair1 AS Logger.KeyValuePair,
                                    INPUT ipoKeyValuePair2 AS Logger.KeyValuePair,
                                    INPUT ipoKeyValuePair3 AS Logger.KeyValuePair,
                                    INPUT ipoKeyValuePair4 AS Logger.KeyValuePair,
                                    INPUT ipoKeyValuePair5 AS Logger.KeyValuePair):
        ASSIGN
          THIS-OBJECT:oKeyValuePair[1] = ipoKeyValuePair1
          THIS-OBJECT:oKeyValuePair[2] = ipoKeyValuePair2
          THIS-OBJECT:oKeyValuePair[3] = ipoKeyValuePair3
          THIS-OBJECT:oKeyValuePair[4] = ipoKeyValuePair4
          THIS-OBJECT:oKeyValuePair[5] = ipoKeyValuePair5
          .                                
        LogMessage(ipcMessageStatement).
        RETURN.
    END CONSTRUCTOR.
    
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    CONSTRUCTOR PUBLIC LogMessage ( INPUT ipcMessageStatement AS CHARACTER,
                                    INPUT ipoKeyValuePair1 AS Logger.KeyValuePair,
                                    INPUT ipoKeyValuePair2 AS Logger.KeyValuePair,
                                    INPUT ipoKeyValuePair3 AS Logger.KeyValuePair,
                                    INPUT ipoKeyValuePair4 AS Logger.KeyValuePair):
        ASSIGN
          THIS-OBJECT:oKeyValuePair[1] = ipoKeyValuePair1
          THIS-OBJECT:oKeyValuePair[2] = ipoKeyValuePair2
          THIS-OBJECT:oKeyValuePair[3] = ipoKeyValuePair3
          THIS-OBJECT:oKeyValuePair[4] = ipoKeyValuePair4
          .                                
        LogMessage(ipcMessageStatement).
        RETURN.
    END CONSTRUCTOR.
    
    
     /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    CONSTRUCTOR PUBLIC LogMessage ( INPUT ipcMessageStatement AS CHARACTER,
                                    INPUT ipoKeyValuePair1 AS Logger.KeyValuePair,
                                    INPUT ipoKeyValuePair2 AS Logger.KeyValuePair,
                                    INPUT ipoKeyValuePair3 AS Logger.KeyValuePair):
        ASSIGN
          THIS-OBJECT:oKeyValuePair[1] = ipoKeyValuePair1
          THIS-OBJECT:oKeyValuePair[2] = ipoKeyValuePair2
          THIS-OBJECT:oKeyValuePair[3] = ipoKeyValuePair3
          .                                
        LogMessage(ipcMessageStatement).
        RETURN.
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    CONSTRUCTOR PUBLIC LogMessage ( INPUT ipcMessageStatement AS CHARACTER,
                                    INPUT ipoKeyValuePair1 AS Logger.KeyValuePair,
                                    INPUT ipoKeyValuePair2 AS Logger.KeyValuePair):
        ASSIGN
          THIS-OBJECT:oKeyValuePair[1] = ipoKeyValuePair1
          THIS-OBJECT:oKeyValuePair[2] = ipoKeyValuePair2
          .                                
        LogMessage(ipcMessageStatement).
        RETURN.
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    CONSTRUCTOR PUBLIC LogMessage ( INPUT ipcMessageStatement AS CHARACTER,
                                    INPUT ipoKeyValuePair1 AS Logger.KeyValuePair):
        THIS-OBJECT:oKeyValuePair = ipoKeyValuePair1.                                
        LogMessage(ipcMessageStatement).
        RETURN.
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    CONSTRUCTOR PUBLIC LogMessage ( INPUT ipcMessageStatement AS CHARACTER ):
        THIS-OBJECT:MessageStatement = ipcMessageStatement.
        RETURN.
    END CONSTRUCTOR.


END CLASS.