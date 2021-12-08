// This is not the best example of how to create dialogue, please read community guides.
BEGIN NPC

    CHAIN IF ~Global("NPCT1","GLOBAL",0)~ THEN NPC b1 
        @11011 //~Welcome <CHARNAME>! Will you accept me on my team?~
    DO ~SetGlobal("NPCT1","GLOBAL",1)~ 
    END

    ++ @11012 /*~Yes. Let's go!~*/ EXTERN NPC b1.1 
    ++ @11013 /*~No. Goodbye!~*/ EXTERN NPC b1.2

    CHAIN NPC b1.1
        @11014 //~Ok, let's move on.~
    END
        ++ @11016 /*~Welcome to the team!~*/ EXTERN NPC b1.join

    CHAIN NPC b1.2
        @11015 // ~Too bad. Farewell!~
    EXIT

    CHAIN NPC b1.join
        @11017 //~Let's go friends!~
        DO ~JoinParty()~
    EXIT

    APPEND NPC
        IF ~Global("NPCT1","GLOBAL",1)~ b2 
            SAY @11018 //~You're back! Have you changed your mind?~
            ++ @11012 /*~Yes. Let's go!~*/ + b1.1
            ++ @11013 /*~No. Goodbye!~*/ + b1.2
        END
    END
