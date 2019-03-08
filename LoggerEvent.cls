 
/*------------------------------------------------------------------------
   File        : LoggerEvent
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : Anbu
   Created     : Sun Feb 10 06:10:30 EST 2019
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Logger.ILogger.
USING Config.LogLevel.
USING Logger.LogMessage.
USING OpenEdge.Core.StringConstant.


CLASS Logger.LoggerEvent :
    
    
    DEFINE PROTECTED PROPERTY dDate AS DATE INITIAL "?" NO-UNDO. 
    DEFINE PROTECTED PROPERTY dtTime AS DATETIME-TZ INITIAL "?" NO-UNDO. GET. PRIVATE SET.
    DEFINE PROTECTED PROPERTY cServerName AS CHARACTER INITIAL "" NO-UNDO. /* should be part of logger instance? */
    DEFINE PROTECTED PROPERTY cSystemName AS CHARACTER INITIAL "" NO-UNDO. /* should be part of logger instance? */
    DEFINE PROTECTED PROPERTY cEnvironment AS CHARACTER INITIAL "" NO-UNDO. /* should be part of logger instance? */
    DEFINE PROTECTED PROPERTY cUserID AS CHARACTER INITIAL "" NO-UNDO. /* should be part of logger instance? */
    DEFINE PROTECTED PROPERTY cLeadNumber AS CHARACTER INITIAL "" NO-UNDO. GET. PRIVATE SET.
    DEFINE PROTECTED PROPERTY iApplicationNumber AS INTEGER INITIAL 0 NO-UNDO. GET. PRIVATE SET.
    DEFINE PROTECTED PROPERTY cLoggerIdentifier AS CHARACTER INITIAL "" NO-UNDO. /* should be part of logger instance? */
    DEFINE PROTECTED PROPERTY cParentFunction AS CHARACTER INITIAL "" NO-UNDO.
    DEFINE PROTECTED PROPERTY cChildFunction AS CHARACTER INITIAL "" NO-UNDO. GET. PRIVATE SET.
    DEFINE PROTECTED PROPERTY cTransitiveIdentifier AS CHARACTER INITIAL "" NO-UNDO. GET. PRIVATE SET.
    DEFINE PROTECTED PROPERTY oLogMessage AS Logger.LogMessage INITIAL ? NO-UNDO. GET. PRIVATE SET.
    
    DEFINE PROTECTED PROPERTY dtStartTime AS DATETIME INITIAL ? NO-UNDO. GET. PRIVATE SET.
    DEFINE PROTECTED PROPERTY dtEndTime AS DATETIME INITIAL ? NO-UNDO. GET. PRIVATE SET.
    
          
    
     /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    CONSTRUCTOR PUBLIC LoggerEvent ( INPUT ipChildFunction AS CHARACTER,
                                     INPUT ipoLogMessage AS Logger.LogMessage ):
       IF ipChildFunction <> ? AND ipChildFunction <> "" THEN                                  
         ASSIGN                                  
           THIS-OBJECT:cChildFunction = ipChildFunction
           THIS-OBJECT:cTransitiveIdentifier = cTransitiveIdentifier +  ipChildFunction.
       LoggerEvent(ipoLogMessage).
       RETURN. 
    END CONSTRUCTOR. 
     
     
     /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    CONSTRUCTOR PUBLIC LoggerEvent ( INPUT ipoLogMessage AS Logger.LogMessage ):
        
        IF NOT VALID-OBJECT(ipoLogMessage) THEN
          ASSIGN ipoLogMessage = NEW LogMessage().
          
        ASSIGN  
          THIS-OBJECT:oLogMessage = ipoLogMessage
          THIS-OBJECT:dtTime = NOW.
         RETURN. 
    END CONSTRUCTOR.

    
    
    
    
    
    
    
/*    // (optional) The logger that initiated this event                                                 */
/*    //DEFINE PUBLIC PROPERTY Logger AS ILogWriter NO-UNDO GET. SET.                                    */
/*                                                                                                       */
/*    // (optional) The name of the logger                                                               */
/*    DEFINE PUBLIC PROPERTY LoggerName AS CHARACTER NO-UNDO GET. SET.                                   */
/*                                                                                                       */
/*    // (mandatory) THe level of this event                                                             */
/*    //DEFINE PUBLIC PROPERTY LogLevel AS LogLevelEnum NO-UNDO GET.                                     */
/*      //  PRIVATE SET.                                                                                 */
/*                                                                                                       */
/*    // The more-or-less exact time when the log event occurred                                         */
/*    DEFINE PUBLIC PROPERTY TimeStamp AS DATETIME-TZ NO-UNDO GET.                                       */
/*        PRIVATE SET.                                                                                   */
/*                                                                                                       */
/*    // The log message                                                                                 */
/*    DEFINE PUBLIC PROPERTY oLogMessage AS LogMessage NO-UNDO GET.                                      */
/*        PRIVATE SET.                                                                                   */
/*                                                                                                       */
/*    // An error to log                                                                                 */
/*    DEFINE PUBLIC PROPERTY Error AS Progress.Lang.Error NO-UNDO GET.                                   */
/*        PRIVATE SET.                                                                                   */
/*                                                                                                       */
/*    // The current stack trace, of where the LOG event occurred. Not the error stack trace             */
/*    DEFINE PUBLIC PROPERTY CallStack AS CHARACTER EXTENT NO-UNDO GET.                                  */
/*        PRIVATE SET.                                                                                   */
/*                                                                                                       */
/*    /* (optional) The user logging this event */                                                       */
/*    DEFINE PUBLIC PROPERTY LoggedBy AS HANDLE NO-UNDO GET. SET.                                        */
/*                                                                                                       */
/*    /* (optional) The short-name of the logger logging this event. The short name is the logger name */*/
/*    DEFINE PUBLIC PROPERTY LoggerShortName AS CHARACTER NO-UNDO GET. SET.                              */
/*                                                                                                       */
/*    /* (optional) The short-name-format of the logger logging this event */                            */
/*    DEFINE PUBLIC PROPERTY ShortNameFormat AS CHARACTER NO-UNDO GET. SET.                              */
/*                                                                                                       */
/*    /* Constructor                                                                                     */
/*                                                                                                       */
/*       @param LogLevelEnum The level this log event was at                                             */
/*       @param LogMessage The message to log                                                            */
/*       @param P.L.Error The error being logged                                                         */
/*       @param datetime-tz The timestamp of the log event */                                            */
/*    CONSTRUCTOR PUBLIC LoggerEvent(INPUT poMessage AS LogMessage,                                      */
/*        INPUT poError AS Progress.Lang.Error,                                                          */
/*        INPUT ptTimeStamp AS DATETIME-TZ):                                                             */
/*       // this-object(poLevel, poMessage, poError).                                                    */
/*                                                                                                       */
/*        ASSIGN                                                                                         */
/*            THIS-OBJECT:TimeStamp = ptTimeStamp.                                                       */
/*    END CONSTRUCTOR.                                                                                   */
/*                                                                                                       */
/*    /* Constructor                                                                                     */
/*                                                                                                       */
/*       @param LogLevelEnum The level this log event was at                                             */
/*       @param LogMessage The message to log                                                            */
/*       @param datetime-tz The timestamp of the log event */                                            */
/*   /* CONSTRUCTOR PUBLIC LoggerEvent(INPUT poLevel AS LogLevelEnum,                                    */
/*        INPUT poMessage AS LogMessage,                                                                 */
/*        INPUT ptTimeStamp AS DATETIME-TZ):                                                             */
/*       // this-object(poLevel, poMessage).                                                             */
/*                                                                                                       */
/*        ASSIGN                                                                                         */
/*            THIS-OBJECT:TimeStamp = ptTimeStamp.                                                       */
/*    END CONSTRUCTOR. */                                                                                */
/*                                                                                                       */
/*    /* Constructor                                                                                     */
/*                                                                                                       */
/*       @param LogLevelEnum The level this log event was at                                             */
/*       @param LogMessage The message to log                                                            */
/*       @param P.L.Error The error being logged */                                                      */
/*/*    CONSTRUCTOR PUBLIC LoggerEvent(INPUT poLevel AS LogLevelEnum,                                    */
/*        INPUT poMessage AS LogMessage,                                                                 */
/*        INPUT poError AS Progress.Lang.Error):                                                         */
/*        this-object(poLevel, poMessage).                                                               */
/*                                                                                                       */
/*        ASSIGN                                                                                         */
/*            THIS-OBJECT:Error = poError.                                                               */
/*    END CONSTRUCTOR. */                                                                                */
/*                                                                                                       */
/*    /* Constructor                                                                                     */
/*                                                                                                       */
/*       @param LogLevelEnum The level this log event was at                                             */
/*       @param LogMessage The message to log */                                                         */
/*    CONSTRUCTOR PUBLIC LoggerEvent(INPUT poLevel AS Config.LogLevel,                                   */
/*        INPUT poMessage AS Logger.LogMessage):                                                         */
/*/*        //IF NOT VALID-OBJECT(poMessage) THEN                      */                                */
/*/*           // ASSIGN poMessage = NEW Logger.LogMessage('':u, '':u).*/                                */
/*/*                                                                   */                                */
/*/*        IF NOT VALID-OBJECT(poLevel) THEN                          */                                */
/*/*            ASSIGN poLevel = LogLevelEnum:DEFAULT.                 */                                */
/*/*                                                                   */                                */
/*/*        ASSIGN                                                     */                                */
/*/*            THIS-OBJECT:Message   = poMessage                      */                                */
/*/*            THIS-OBJECT:TimeStamp = NOW                            */                                */
/*/*            THIS-OBJECT:LogLevel  = poLevel                        */                                */
/*            .                                                                                          */
/*        BuildStack().                                                                                  */
/*    END CONSTRUCTOR.                                                                                   */
/*                                                                                                       */
/*    /* Destructor */                                                                                   */
/*    DESTRUCTOR PUBLIC LoggerEvent():                                                                   */
/*        IF VALID-HANDLE(THIS-OBJECT:LoggedBy) THEN                                                     */
/*            DELETE OBJECT THIS-OBJECT:LoggedBy NO-ERROR.                                               */
/*    END DESTRUCTOR.                                                                                    */
/*                                                                                                       */
/*    /* Builds the calls stack of the log event */                                                      */
/*    METHOD PRIVATE CHARACTER EXTENT BuildStack():                                                      */
/*        DEFINE VARIABLE iMax      AS INTEGER   NO-UNDO.                                                */
/*        DEFINE VARIABLE iLoop     AS INTEGER   NO-UNDO.                                                */
/*        DEFINE VARIABLE cStack    AS CHARACTER NO-UNDO.                                                */
/*        DEFINE VARIABLE cDelim    AS CHARACTER NO-UNDO.                                                */
/*        DEFINE VARIABLE cProgName AS CHARACTER NO-UNDO.                                                */
/*                                                                                                       */
/*        // we want the line that did the logging. If -debugalert is set, always show                   */
/*/*        IF NOT SESSION:DEBUG-ALERT                        */                                         */
/*/*            AND THIS-OBJECT:LogLevel LT LogLevelEnum:DEBUG*/                                         */
/*/*            THEN                                          */                                         */
/*/*            ASSIGN iMax = 1.                              */                                         */
/*                                                                                                       */
/*        ASSIGN                                                                                         */
/*            cDelim = '':u                                                                              */
/*            iLoop  = 1                                                                                 */
/*            .                                                                                          */
/*        DO WHILE PROGRAM-NAME(iLoop) NE ?:                                                             */
/*            ASSIGN                                                                                     */
/*                cProgName = PROGRAM-NAME(iLoop)                                                        */
/*                iLoop     = iLoop + 1                                                                  */
/*                .                                                                                      */
/*            // don't add the logging infrastructure to the log stack                                   */
/*/*            IF NUM-ENTRIES(cProgName, StringConstant:SPACE) GE 2 THEN*/                              */
/*/*                CASE ENTRY(2, cProgName, StringConstant:SPACE):      */                              */
/*/*                    WHEN GET-CLASS(Log4ABL.Logger):TypeName OR       */                              */
/*/*                    WHEN THIS-OBJECT:GetClass():TypeName THEN        */                              */
/*/*                        NEXT.                                        */                              */
/*/*                END CASE.                                            */                              */
/*                                                                                                       */
/*            ASSIGN                                                                                     */
/*                cStack = cStack + cDelim + cProgName                                                   */
/*                cDelim = StringConstant:LF.                                                            */
/*            IF iMax EQ 1 THEN                                                                          */
/*                LEAVE.                                                                                 */
/*        END.                                                                                           */
/*                                                                                                       */
/*        IF iMax EQ 0 THEN                                                                              */
/*            ASSIGN iMax = NUM-ENTRIES(cStack, cDelim).                                                 */
/*                                                                                                       */
/*        ASSIGN                                                                                         */
/*            EXTENT(CallStack) = iMax.                                                                  */
/*        DO iLoop = 1 TO iMax:                                                                          */
/*            ASSIGN                                                                                     */
/*                CallStack[iLoop] = ENTRY(iLoop, cStack, StringConstant:LF).                            */
/*        END.                                                                                           */
/*    END METHOD.                                                                                        */
    
END CLASS.

