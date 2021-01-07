trigger ContactOwnerChangeTrigger on Contact (before insert) {
    ProgramFlowExperiment pf = new ProgramFlowExperiment();
    pf.HandleContactUpdateTrigger1(trigger.new, trigger.oldMap);
}    