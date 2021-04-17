trigger EventTrigger on Message_Event__e (after insert) {
    for(Message_Event__e ev: Trigger.new) {
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> sendTo = new List<String>();
        sendTo.add('riccardo.rotatori@gmail.com');
        mail.setToAddresses(sendTo);
        mail.setSubject('Test Message Platfomr Event');
        String body = ev.Description__c;
        mail.setHtmlBody(body);
        mails.add(mail);
        Messaging.sendEmail(mails);
    }
}