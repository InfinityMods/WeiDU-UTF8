// This is not the best example of how to create dialogue, please read community guides.
BEGIN NPCP

    IF ~Global("NPCKickedOut","GLOBAL",0)~ b2
        SAY @11019 //~Do you want me to leave?~
        ++ @11020 /*~Yes.~*/ DO ~SetGlobal("NPCKickedOut","GLOBAL",1)~ EXIT
        ++ @11021 /*~No.~*/ DO ~JoinParty()~ EXIT
    END

    IF ~Global("NPCKickedOut","GLOBAL",1)~ b3
        SAY @11018 //~You're back! Have you changed your mind?~
        ++ @11020 /*~Yes.~*/ + b3.1
        ++ @11021 /*~No.~*/ + b3.2
    END 

    IF ~~ b3.1
        SAY @11022 //~Ok, let's move on.~
        IF ~~ DO ~SetGlobal("NPCKickedOut","GLOBAL",0) JoinParty()~ EXIT
    END

    IF ~~ b3.2
        SAY @11023 //~Too bad. Goodbye.~
    IF ~~ EXIT

    END
