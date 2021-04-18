trigger case_au on Case (after update) {
    Message_Event__e ev1 = new Message_Event__e();
    ev1.description__c = 'Message 1';
    Eventbus.publish(ev1);

    Message_Event__e ev2 = new Message_Event__e();
    ev2.description__c = 'Message 2';
    Eventbus.publish(ev2);

    System.debug('*** ev1');
    System.debug('*** ev2');
}