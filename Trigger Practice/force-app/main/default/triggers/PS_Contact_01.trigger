trigger PS_Contact_01 on Contact (before insert) {
    
    //when you create a contact , update the Firstname "kumar"

    PS_Contact_01Handler.beforeUpdate(Trigger.New);
}